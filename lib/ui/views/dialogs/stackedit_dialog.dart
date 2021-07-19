import 'package:flutter/material.dart';
import 'package:utilities/drag_area.dart';

class StackeditDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ui.platformViewRegistry
    //     .registerViewFactory(createdViewId, (int viewId) => iframe);
    // setState(mounted, this.setState, () {
    //   summernoteInit = Future.value(true);
    // });
    return IgnorePointer(
        child: Container(
            child: AbsorbPointer(
      child: DragArea(
          child: Container(
        width: 100,
        height: 100,
        child: Scaffold(
          appBar: AppBar(),
          // body: HtmlElementView(
          //   viewType: 'stackedit',
          // ),
        ),
      )),
    )));
  }
}
