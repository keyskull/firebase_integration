part of 'window_layer.dart';

final boxConstraints = BoxConstraints(
    minHeight: 200,
    minWidth: 200,
    maxWidth: ScreenSize.getScreenSize.width * 0.8,
    maxHeight: ScreenSize.getScreenSize.height);
final boxDecoration =
    BoxDecoration(color: Colors.white, border: Border.all(width: 2));

abstract class WindowFrame extends StatefulWidget {
  final Widget child;
  final String id;
  final Offset position;

  WindowFrame(this.child, this.id, {this.position = const Offset(100, 100)});

  WindowWidget frameDecorationBuilder(
      BuildContext context,
      Widget child,
      String id,
      Widget closeButton,
      Widget minimizeButton,
      Widget maximizeButton);

  @override
  State<StatefulWidget> createState() =>
      WindowFrameState(child, id, position, frameDecorationBuilder);
}

class WindowFrameState extends State<WindowFrame> {
  final Widget child;
  final String id;
  final WindowWidget Function(
      BuildContext context,
      Widget child,
      String id,
      Widget closeButton,
      Widget minimizeButton,
      Widget maximizeButton) frameDecorationBuilder;
  Offset position;

  WindowFrameState(
      this.child, this.id, this.position, this.frameDecorationBuilder);

  @override
  Widget build(BuildContext context) {
    final Widget closeButton = ElevatedButton(
        onPressed: () {
          log('closing window: $id}');
          windowContainer.closeWindow(id);
        },
        child: Icon(Icons.close));

    final Widget minimizeButton =
        ElevatedButton(onPressed: () {}, child: Icon(Icons.minimize));

    final Widget maximizeButton =
        ElevatedButton(onPressed: () {}, child: Icon(Icons.add));
    final frameDecoration = frameDecorationBuilder(
        context, child, id, closeButton, minimizeButton, maximizeButton);

    final builtTitle = Container(
        constraints: BoxConstraints(maxHeight: 30, minWidth: 200),
        child: frameDecoration.windowBar);
    final builtContent =
        Container(constraints: boxConstraints, child: frameDecoration.content);

    final dragWidget = Draggable(
      maxSimultaneousDrags: 1,
      feedback: Container(
          constraints: boxConstraints,
          decoration: boxDecoration,
          child: Scaffold(
              primary: false,
              body: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [builtTitle, builtContent],
              ))),
      onDragEnd: (details) {
        setState(() {
          position = details.offset;
        });
        windowContainer.activatingWindow(id);
      },
      child: builtTitle,
    );
    final builtChild2 = GestureDetector(
        onTapDown: (tapDownDetail) {
          windowContainer.activatingWindow(id);
        },
        child: Container(
            constraints: boxConstraints,
            decoration: boxDecoration,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [dragWidget, builtContent],
            )));
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: builtChild2,
    );
  }
}

class WindowWidget {
  final Widget windowBar;
  final Widget content;

  WindowWidget({
    required this.windowBar,
    required this.content,
  });
}
