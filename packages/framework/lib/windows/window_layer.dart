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

/// [WindowLayer] is the top layer which is use for managing the widget which
/// implemented [SingleWindowInterface] mixin class.
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
}

///
/// When the windows queue update the state also need to update.
class InstanceView extends StatefulWidget {
  InstanceView({Key? key}) : super(key: key);

  @override
  _InstanceViewState createState() => _InstanceViewState();
}

class _InstanceViewState extends State<InstanceView> {
  List<Widget> instances = [];
  updateInstances() {
    setState(() {
      instances = windowContainer.instanceBuilders.map((e) {
        log("generating instance: " + e.id.toString(), name: "window_layer");
        return Positioned(
            left: e.position.dx,
            top: e.position.dy,
            child: e.windowBuilder(e.id).buildSingleWindowInterface());
      }).toList();
    });
  }

  @override
  void initState() {
    instances = windowContainer.instanceBuilders
        .map((e) => Positioned(
            left: e.position.dx,
            top: e.position.dy,
            child: e.windowBuilder(e.id).buildSingleWindowInterface()))
        .toList();
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
                  instances.add(instances.last);
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
  final int id;

  const Instance({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return windowContainer.instanceBuilders[id]
        .windowBuilder(windowContainer.instanceBuilders[id].id)
        .buildSingleWindowInterface();
  }
}

class InstanceBuilder {
  late String id;
  Offset position = Offset(100, 100);
  SingleWindowInterface Function(String id) windowBuilder;

  InstanceBuilder(this.windowBuilder);
}

///
/// Problem: hasn't have the correct order when closing the windows;
///
class WindowContainer {
  List<InstanceBuilder> instanceBuilders = [];

  _InstanceViewState? currentState;

  bool isActive(WindowFrame windowFrame) =>
      instanceBuilders.last.id == windowFrame.id;

  List<String> getWindowIdList() => instanceBuilders.map((e) => e.id).toList();

  closeWindow(String id) {
    log("Removing window: " + id.toString(), name: "window_layer");
    instanceBuilders.removeWhere((e) => e.id == id);
    currentState?.updateInstances();
  }

  openWindow(InstanceBuilder instanceBuilder) {
    final id = new Uuid().v1();
    instanceBuilder.id = id;
    log("Opened window: " + id, name: "window_layer");

    instanceBuilders.add(instanceBuilder);
    currentState?.updateInstances();
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

    final index = instanceBuilders.indexWhere((e) => e.id == id);
    log("updated index: $index", name: "WindowLayerState");

    if (index != -1 &&
        index < instanceBuilders.length &&
        index != instanceBuilders.length - 1) {
      final _ib = instanceBuilders[index];
      instanceBuilders[index] = instanceBuilders.last;
      instanceBuilders[instanceBuilders.length - 1] = _ib;
      currentState?.updateInstances();
    }

    // if (_windowMode is WindowFrame) (_windowMode as WindowFrame);
  }

  updatePosition(String id, Offset offset) {
    final builder = instanceBuilders.firstWhere((element) => element.id == id);
    builder.position = offset;
    currentState?.updateInstances();
  }
}
