part of 'window_layer.dart';

final boxConstraints = BoxConstraints(
    minHeight: 200,
    minWidth: 200,
    maxWidth: ScreenSize.getScreenSize.width * 0.8,
    maxHeight: ScreenSize.getScreenSize.height * 0.8);
final boxDecoration =
BoxDecoration(color: Colors.white, border: Border.all(width: 2));

abstract class WindowFrame extends StatelessWidget {
  final Widget child;
  final String id;
  final Offset? position;

  WindowFrame(this.child, this.id, {this.position});

  WindowWidget frameDecorationBuilder(
      BuildContext context,
      Widget child,
      String id,
      Widget closeButton,
      Widget minimizeButton,
      Widget maximizeButton);

  @override
  Widget build(BuildContext context) {
    if (position != null) windowContainer.updatePosition(id, position!);
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
        constraints: BoxConstraints.expand(height: 30),
        child: frameDecoration.windowBar);
    final builtContent = Padding(
        padding: EdgeInsets.only(top: 30),
        child: Container(
            constraints: boxConstraints, child: frameDecoration.content));

    final builtChild = PointerInterceptor(
        child: DefaultTextStyle(
            style: TextStyle(fontSize: 20, color: Colors.black),
            child: Container(
                constraints: boxConstraints,
                decoration: boxDecoration,
                child: Stack(
                  children: [builtTitle, builtContent],
                ))));

    final dragWidget = Draggable(
      maxSimultaneousDrags: 1,
      feedback: builtChild,
      onDragEnd: (details) {
        windowContainer.updatePosition(id, details.offset);
      },
      childWhenDragging: Container(),
      onDragStarted: () => windowContainer.activatingWindow(id),
      child: builtChild,
      rootOverlay: true,
    );
    return dragWidget;
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
