import 'package:flutter/material.dart';
import 'package:framework/widgets/default_window_frame.dart';
import 'package:provider/provider.dart';
import 'package:universal_scroll_view/universal_single_child_scroll_view.dart';

part 'single_window_interface.dart';
part 'window_frame.dart';

// SingleWindowInterface.buildWithSingleWindowInterface(DragArea(
//     child: Container(
//   width: 100,
//   height: 100,
//   child: Scaffold(
//     appBar: AppBar(),
//     // body: HtmlElementView(
//     //   viewType: 'stackedit',
//     // ),
//   ),
// )))

final _WindowContainer windowContainer = new _WindowContainer();

/// [WindowLayer] is the top layer which is use for managing the widget
/// implemented [SingleWindowInterface] mixin class.
class WindowLayer extends StatefulWidget {
  final Widget child;

  WindowLayer({required this.child});

  @override
  State<StatefulWidget> createState() => WindowLayerSate(child: child);
}

///
/// When the windows queue update the state also need to update.
/// Idea 1: listener
class WindowLayerSate extends State<WindowLayer> {
  final Widget child;

  WindowLayerSate({required this.child});

  // TODO: problem: window layer hasn't update in the first time
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<_WindowContainer>(
        create: (_) => windowContainer,
        child: Stack(
          children: [child] + windowContainer.windows.toList(),
        ));
  }
}

class _WindowContainer extends ChangeNotifier {
  List<SingleWindowInterface> _windows = [];

  List<SingleWindowInterface> get windows => _windows;

  closeWindow(SingleWindowInterface singleWindowInterface) {
    _windows.remove(singleWindowInterface);
    notifyListeners();
  }

  openWindow(SingleWindowInterface singleWindowInterface) {
    _windows.add(singleWindowInterface);
    notifyListeners();
  }

  // TODO: _windowMode unfinished
  @protected
  activatingWindow(SingleWindowInterface singleWindowInterface) {
    if (_windows.length > 1) {
      _windows[_windows.indexOf(singleWindowInterface)] = _windows.last;
      _windows[_windows.length - 1] = singleWindowInterface;
    }
    notifyListeners();

    // if (_windowMode is WindowFrame) (_windowMode as WindowFrame);
  }
}
