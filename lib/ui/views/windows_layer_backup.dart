// import 'package:cullen/ui/components/bottom/footer.dart';
// import 'package:flutter/material.dart';
// import 'package:universal_scroll_view/universal_single_child_scroll_view.dart';
// import 'package:utilities/drag_area.dart';
//
// List<SingleWindowInterface> _windows = [
//   SingleWindowInterface.buildWithSingleWindowInterface(DragArea(
//       child: Container(
//     width: 100,
//     height: 100,
//     child: Scaffold(
//       appBar: AppBar(),
//       // body: HtmlElementView(
//       //   viewType: 'stackedit',
//       // ),
//     ),
//   )))
// ];
//
// enum ScreenMode { window, fullScreen, onlyFullScreen }
//
// class WindowFrame extends StatefulWidget {
//   final Widget child;
//
//   WindowFrame(this.child);
//
//   @override
//   State<StatefulWidget> createState() => WindowFrameState(child);
// }
//
// class WindowFrameState extends State<WindowFrame> {
//   final Widget child;
//
//   WindowFrameState(this.child);
//
//   @override
//   Widget build(BuildContext context) => Container(child: child);
// }
//
// class _Init {
//   bool init = false;
// }
//
// mixin SingleWindowInterface on Widget {
//   bool inheritScrollingFeature();
//
//   ScreenMode setScreenMode() => ScreenMode.onlyFullScreen;
//
//   Widget setFooter() => Footer();
//
//   bool showFooter() => true;
//   final _init = _Init();
//   late final Widget Function(Widget child) _windowMode;
//   late final Widget Function(Widget child) _scrollview;
//   late final Widget Function(Widget child) _footerLayer;
//
//   initSingleWindowInterface() {
//     if (_init.init != true) {
//       _footerLayer = showFooter()
//           ? (Widget child) => Column(
//                 children: [child, setFooter()],
//               )
//           : (Widget child) => child;
//
//       _scrollview = inheritScrollingFeature()
//           ? (child) =>
//               UniversalSingleChildScrollView(child: _footerLayer(child))
//           : (child) => Container(child: child);
//       this._windowMode = (Widget child) {
//         switch (setScreenMode()) {
//           case ScreenMode.onlyFullScreen:
//             return _scrollview(child);
//           case ScreenMode.window:
//             return WindowFrame(_scrollview(child));
//           case ScreenMode.fullScreen:
//             return WindowFrame(_scrollview(child));
//           default:
//             return _scrollview(child);
//         }
//       };
//       _init.init = true;
//     }
//   }
//
//   Widget buildSingleWindowInterface() => _windowMode(this);
//
//   static SingleWindowInterface buildWithSingleWindowInterface(Widget child) =>
//       new _InstanceSingleWindowInterface(child);
// }
//
// class _InstanceSingleWindowInterface extends StatelessWidget
//     with SingleWindowInterface {
//   final Widget child;
//
//   _InstanceSingleWindowInterface(this.child);
//
//   @override
//   Widget build(BuildContext context) {
//     this.initSingleWindowInterface();
//     return child;
//   }
//
//   @override
//   bool inheritScrollingFeature() => false;
// }
//
// class WindowsLayer extends StatefulWidget {
//   final Widget child;
//
//   WindowsLayer({required this.child});
//
//   @override
//   State<StatefulWidget> createState() => WindowLayerSate(child: child);
// }
//
// class WindowLayerSate extends State<WindowsLayer> {
//   final Widget child;
//
//   WindowLayerSate({required this.child});
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       // fit: StackFit.expand,
//       children: [child] + _windows,
//     );
//   }
// }
