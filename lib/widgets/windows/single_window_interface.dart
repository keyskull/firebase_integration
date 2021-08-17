part of '../../framework.dart';

enum ScreenMode { window, fullScreen, onlyFullScreen }

mixin SingleWindowInterfaceMixin on Widget {
  late ScreenMode _screenMode = ScreenMode.onlyFullScreen;
  late String _id = "Unknown Instance";

  Widget _scrollview(Widget child) =>
      scrollable() ? UniversalSingleChildScrollView(child: child) : child;

  Widget _framework(Widget child) {
    switch (_screenMode) {
      case ScreenMode.onlyFullScreen:
        return _scrollview(child);
      case ScreenMode.window:
        return windowFrameBuilder(_scrollview(child));
      case ScreenMode.fullScreen:
        return windowFrameBuilder(_scrollview(child));
      default:
        return _scrollview(child);
    }
  }

  @protected
  String getId() => _id;

  bool scrollable();

  void initWindow() {}

  WindowFrame windowFrameBuilder(Widget child) =>
      DefaultWindowFrame(child, getId());

  void setScreenMode(ScreenMode screenMode) => _screenMode = screenMode;

  @protected
  Widget buildSingleWindowInterface() {
    initWindow();
    return _framework(this);
  }

  static SingleWindowInterfaceMixin buildWithSingleWindowInterface(
          String id, Widget child,
          {bool isScrollable = false,
          ScreenMode screenMode = ScreenMode.window}) =>
      new _InstanceSingleWindowInterface(id, child);
}

class _InstanceSingleWindowInterface extends StatelessWidget
    with SingleWindowInterfaceMixin {
  final Widget child;
  final String id;
  final ScreenMode screenMode;
  final bool isScrollable;

  _InstanceSingleWindowInterface(this.id, this.child,
      {this.isScrollable = false, this.screenMode = ScreenMode.window}) {
    this._id = id;
  }

  @override
  Widget build(BuildContext context) => this.child;

  @override
  void initWindow() => this.setScreenMode(this.screenMode);

  @override
  bool scrollable() => this.isScrollable;
}
