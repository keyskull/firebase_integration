import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:framework/widgets/default_window_frame.dart';
import 'package:universal_scroll_view/universal_single_child_scroll_view.dart';
import 'package:utilities/screen_size.dart';
import 'package:uuid/uuid.dart';

part 'single_window_interface.dart';
part 'window_frame.dart';

WindowContainer windowContainer = WindowContainer();

/// [WindowLayer] is the top layer which is use for managing the widget
/// implemented [SingleWindowInterface] mixin class.
///
/// When the windows queue update the state also need to update.
class WindowLayer extends StatelessWidget {
  final Widget child;

  WindowLayer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [child, InstanceView()],
    );
  }

// @override
// void initState() {
//   WidgetsBinding.instance!.endOfFrame.then(
//     (_) => setState(() {}),
//   );
//   super.initState();
// }
}

class InstanceView extends StatefulWidget {
  InstanceView({Key? key}) : super(key: key);

  @override
  _InstanceViewState createState() => _InstanceViewState();
}

class _InstanceViewState extends State<InstanceView> {
  List<String> widgetIds = [];
  List<Widget> instances = [];

  updateIds(List<String> ids) {
    setState(() {
      widgetIds = ids;
      instances = widgetIds.map((id) {
        log("generating instance: " + id.toString(), name: "window_layer");
        return new Instance(id: id);
      }).toList();
    });
  }

  @override
  void initState() {
    widgetIds = windowContainer.ids;
    windowContainer.currentState = this;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("list: [" + instances.map((e) => e.hashCode).join(',') + ']');
    return Stack(
      children: <Widget>[
            MaterialButton(
              onPressed: () {
                setState(() {
                  widgetIds.add(windowContainer.instanceBuilders.last.id);
                });
              },
              child: Text("dasdsada"),
            )
          ] +
          instances,
    );
  }
}

class Instance extends StatelessWidget {
  final String id;

  const Instance({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return windowContainer.instanceBuilders
        .firstWhere((element) => element.id == id)
        .windowBuilder(id);
  }
}

class InstanceBuilder {
  late String id;

  SingleWindowInterface Function(String id) windowBuilder;

  InstanceBuilder(this.windowBuilder);
}

///
/// Problem: hasn't have the correct order when closing the windows;
///
class WindowContainer {
  List<InstanceBuilder> instanceBuilders = [];

  List<String> ids = [];

  _InstanceViewState? currentState;

  bool isActive(WindowFrame windowFrame) => ids.last == windowFrame.id;

  List<String> getWindowIdList() => instanceBuilders.map((e) => e.id).toList();

  closeWindow(String id) {
    log("Removed window: " + id, name: "window_layer");
    instanceBuilders.removeWhere((element) => element.id == id);
    ids.remove(id);
    currentState?.updateIds(ids);
  }

  openWindow(InstanceBuilder instanceBuilder) {
    final id = new Uuid().v1();
    instanceBuilder.id = id;
    log("Opened window: " + id, name: "window_layer");

    instanceBuilders.add(instanceBuilder);
    ids.add(id);
    currentState?.updateIds(ids);
    log("List of windows: [" + getWindowIdList().join(',') + ']',
        name: "window_layer");
    log("Length of windows: [" + getWindowIdList().length.toString() + ']',
        name: "window_layer");
  }

  // TODO: _windowMode unfinished
  @protected
  activatingWindow(String id) {
    log('Activating window: $id', name: "window_layer");
    log("List of windows: [" + getWindowIdList().join(',') + ']',
        name: "window_layer");

    final index = ids.indexOf(id);

    if (index != -1 && index < ids.length && index != ids.length - 1) {
      log("updated index: $index", name: "WindowLayerState");
      final instance = ids[index];
      ids[index] = ids[ids.length - 1];
      ids[ids.length - 1] = instance;
    }
    currentState?.updateIds(ids);

    // if (_windowMode is WindowFrame) (_windowMode as WindowFrame);
  }
}
