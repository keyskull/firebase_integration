part of 'window_layer.dart';

abstract class WindowFrame extends StatelessWidget {
  final Widget child;
  final WindowInstance windowInstance;

  WindowFrame(this.child, this.windowInstance);

  Widget frameDecorationBuilder(BuildContext context, Widget child,
      Widget closeButton, Widget minimizeButton, Widget maximizeButton);

  @override
  Widget build(BuildContext context) {
    final windowContainer =
        Provider.of<WindowContainer>(context, listen: false);

    final Widget closeButton = ElevatedButton(
        onPressed: () {
          log('closing window: ${windowInstance.getId()}');
          windowContainer.closeWindow(windowInstance._singleWindowInterface);
        },
        child: Icon(Icons.close));

    final Widget minimizeButton =
        ElevatedButton(onPressed: () {}, child: Icon(Icons.minimize));

    final Widget maximizeButton =
        ElevatedButton(onPressed: () {}, child: Icon(Icons.add));

    return GestureDetector(
        onTapDown: (tapDownDetail) {
          windowContainer
              .activatingWindow(windowInstance._singleWindowInterface);
        },
        child: frameDecorationBuilder(
            context, child, closeButton, minimizeButton, maximizeButton));
  }
}
