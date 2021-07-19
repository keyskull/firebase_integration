import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:framework/widgets/default_window_frame.dart';
import 'package:provider/provider.dart';
import 'package:universal_scroll_view/universal_single_child_scroll_view.dart';
import 'package:uuid/uuid.dart';

part 'single_window_interface.dart';
part 'window_frame.dart';

// final _WindowContainer windowContainer = _WindowContainer();

/// [WindowLayer] is the top layer which is use for managing the widget
/// implemented [SingleWindowInterface] mixin class.
// class WindowLayer extends StatefulWidget {
//   final Widget child;
//
//   WindowLayer({required this.child});
//
//   @override
//   State<StatefulWidget> createState() => WindowLayerSate(child: child);
// }

///
/// When the windows queue update the state also need to update.
class WindowLayer extends StatelessWidget with ChangeNotifier {
  final Widget child;
  late WindowContainer handle;

  WindowLayer({required this.child});

  @override
  Widget build(BuildContext context) {
    handle = Provider.of<WindowContainer>(context, listen: true);
    handle.addListener(notifyListeners);
    return Stack(
      children: [child, handle.getWindowInstance()],
    );
  }
}

///
/// Problem: hasn't update widget when remove or reorder windows;
///
class WindowContainer extends ChangeNotifier {
  final _uuid = new Uuid();

  List<SingleWindowInterface> _windowInstances = [];

  Widget getWindowInstance() => Stack(children: _windowInstances.toList());

  SingleWindowInterface activeWindow() => _windowInstances.last;
  SingleWindowInterface isActive() => _windowInstances.last;

  List<int> getWindowIdList() =>
      _windowInstances.map((e) => e.hashCode).toList();

  closeWindow(SingleWindowInterface singleWindowInterface) {
    _windowInstances.remove(singleWindowInterface);
    log("Removed window: " + singleWindowInterface.windowInstance.id,
        name: "window_layer");
    log(
        "Removing window hashcode: " +
            singleWindowInterface.hashCode.toString(),
        name: "window_layer");
    log(
        "List of Instance windows hashcode: " +
            _windowInstances.map((e) => e.hashCode).join(','),
        name: "window_layer");
    log("Length of windows: [" + _windowInstances.length.toString() + ']',
        name: "window_layer");
    notifyListeners();
  }

  openWindow(SingleWindowInterface singleWindowInterface) {
    final id = _uuid.v1();
    singleWindowInterface.windowInstance.id = id;
    _windowInstances.add(singleWindowInterface);
    log("Opened window: " + id, name: "window_layer");
    log("List of windows: [" + getWindowIdList().join(',') + ']',
        name: "window_layer");
    log("Length of windows: [" + getWindowIdList().length.toString() + ']',
        name: "window_layer");
    notifyListeners();
  }

  // TODO: _windowMode unfinished
  @protected
  activatingWindow(SingleWindowInterface singleWindowInterface) {
    final int index = _windowInstances.indexOf(singleWindowInterface);
    log('Activating window: $singleWindowInterface', name: "window_layer");
    log("List of windows: [" + _windowInstances.join(',') + ']',
        name: "window_layer");
    if (index != -1) {
      _windowInstances[index] = _windowInstances.last;
      _windowInstances[_windowInstances.length - 1] = singleWindowInterface;
    }
    notifyListeners();

    // if (_windowMode is WindowFrame) (_windowMode as WindowFrame);
  }
}
