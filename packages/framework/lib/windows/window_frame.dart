part of 'window_layer.dart';

abstract class WindowFrame extends StatefulWidget {
  final Widget child;
  final SingleWindowInterface singleWindowInterface;
  WindowFrame(this.child, this.singleWindowInterface);

  Widget frameDecorationBuilder(Widget child, Widget closeButton,
      Widget minimizeButton, Widget maximizeButton);

  @protected
  @override
  State<StatefulWidget> createState() =>
      WindowFrameState(child, frameDecorationBuilder, singleWindowInterface);
}

class WindowFrameState extends State<WindowFrame> {
  final Widget child;
  final SingleWindowInterface singleWindowInterface;

  final Widget Function(Widget child, Widget closeButton, Widget minimizeButton,
      Widget maximizeButton) frameDecorationBuilder;
  final Widget closeButton = IconButton(
      onPressed: () => windowContainer.closeWindow, icon: Icon(Icons.close));

  final Widget minimizeButton =
      IconButton(onPressed: () {}, icon: Icon(Icons.minimize));

  final Widget maximizeButton =
      IconButton(onPressed: () {}, icon: Icon(Icons.add));

  WindowFrameState(
      this.child, this.frameDecorationBuilder, this.singleWindowInterface);

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTapDown: (tapDownDetail) {
        setState(() {
          windowContainer.activatingWindow(singleWindowInterface);
        });
      },
      child: frameDecorationBuilder(
          child, closeButton, minimizeButton, maximizeButton));
}
