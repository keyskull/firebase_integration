part of 'window_layer.dart';

enum ScreenMode { window, fullScreen, onlyFullScreen }

class WindowInstance {
  final SingleWindowInterface _singleWindowInterface;
  late String id = "Unknown Instance";
  WindowInstance(this._singleWindowInterface);

  String getId() => id;
}

mixin SingleWindowInterface on Widget {
  late final WindowInstance windowInstance = new WindowInstance(this);

  late final Widget Function(Widget child) _scrollview = scrollable()
      ? (child) => UniversalSingleChildScrollView(child: child)
      : (child) => child;
  late final Widget Function(Widget child) _framework = (Widget child) {
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
  bool scrollable();

  WindowFrame windowFrameBuilder(Widget child) =>
      DefaultWindowFrame(child, windowInstance);

  ScreenMode setScreenMode() => ScreenMode.onlyFullScreen;

  Widget buildSingleWindowInterface() => _framework(this);

  late final Widget built = buildSingleWindowInterface();

  static SingleWindowInterface buildWithSingleWindowInterface(Widget child,
          {bool isScrollable = false,
          ScreenMode screenMode = ScreenMode.window}) =>
      new _InstanceSingleWindowInterface(child);
}

class _InstanceSingleWindowInterface extends StatelessWidget
    with SingleWindowInterface {
  final Widget child;
  final ScreenMode screenMode;
  final bool isScrollable;
  _InstanceSingleWindowInterface(this.child,
      {this.isScrollable = false, this.screenMode = ScreenMode.window});

  @override
  Widget build(BuildContext context) {
    return this._framework(child);
  }

  @override
  ScreenMode setScreenMode() => ScreenMode.window;

  @override
  bool scrollable() => isScrollable;
}
