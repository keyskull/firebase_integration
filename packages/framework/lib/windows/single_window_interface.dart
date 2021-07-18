part of 'window_layer.dart';

enum ScreenMode { window, fullScreen, onlyFullScreen }

mixin SingleWindowInterface on Widget {
  bool scrollable();

  WindowFrame windowFrameBuilder(Widget child) =>
      DefaultWindowFrame(child, this);

  ScreenMode setScreenMode() => ScreenMode.onlyFullScreen;

  late final Widget Function(Widget child) _windowMode = (Widget child) {
    switch (setScreenMode()) {
      case ScreenMode.onlyFullScreen:
        return _scrollview(child);
      case ScreenMode.window:
        return windowFrameBuilder(_scrollview(child));
      case ScreenMode.fullScreen:
        return windowFrameBuilder(_scrollview(child));
      default:
        return _scrollview(child);
    }
  };
  late final Widget Function(Widget child) _scrollview = scrollable()
      ? (child) => UniversalSingleChildScrollView(child: child)
      : (child) => child;

  Widget buildSingleWindowInterface() => _windowMode(this);

  static SingleWindowInterface buildWithSingleWindowInterface(Widget child) =>
      new _InstanceSingleWindowInterface(child);
}

class _InstanceSingleWindowInterface extends StatelessWidget
    with SingleWindowInterface {
  final Widget child;

  _InstanceSingleWindowInterface(this.child);

  @override
  Widget build(BuildContext context) {
    return this._windowMode(child);
  }

  @override
  bool scrollable() => false;
}
