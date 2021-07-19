import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utilities/drag_area.dart';

import '../windows/window_layer.dart';

class DefaultWindowFrame extends WindowFrame {
  DefaultWindowFrame(Widget child, WindowInstance windowInstance)
      : super(child, windowInstance);

  @override
  Widget frameDecorationBuilder(
          context, child, closeButton, minimizeButton, maximizeButton) =>
      DragArea(
        child: Container(
            constraints: BoxConstraints(minHeight: 100, minWidth: 200),
            color: Colors.white,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ColoredBox(
                  color: Provider.of<WindowContainer>(context, listen: false)
                              .activeWindow()
                              .built ==
                          this
                      ? Colors.blue
                      : Colors.lightBlueAccent,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [closeButton, maximizeButton, minimizeButton],
                  )),
              child,
            ])),
      );
}
