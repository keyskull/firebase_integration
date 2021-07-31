part of 'window_layer.dart';

enum ScreenMode { window, fullScreen, onlyFullScreen }

mixin SingleWindowInterface on Widget {
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

  late String _id = "Unknown Instance";

  String getId() => _id;
  bool scrollable();

  WindowFrame windowFrameBuilder(Widget child) =>
      DefaultWindowFrame(child, getId());

  ScreenMode setScreenMode() => ScreenMode.onlyFullScreen;

  Widget buildSingleWindowInterface() => _framework(this);

  static SingleWindowInterface buildWithSingleWindowInterface(
          String id, Widget child,
          {bool isScrollable = false,
          ScreenMode screenMode = ScreenMode.window}) =>
      new _InstanceSingleWindowInterface(id, child);
}

class _InstanceSingleWindowInterface extends StatelessWidget
    with SingleWindowInterface {
  final Widget child;
  final String id;
  final ScreenMode screenMode;
  final bool isScrollable;

  _InstanceSingleWindowInterface(this.id, this.child,
      {this.isScrollable = false, this.screenMode = ScreenMode.window}) {
    this._id = id;
  }

  @override
  Widget build(BuildContext context) => _framework(child);

  @override
  ScreenMode setScreenMode() => ScreenMode.window;

  @override
  bool scrollable() => isScrollable;
}
