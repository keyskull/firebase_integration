import 'package:flutter/material.dart';

import '../windows/window_layer.dart';

class DefaultWindowFrame extends WindowFrame {
  DefaultWindowFrame(Widget child, SingleWindowInterface singleWindowInterface)
      : super(child, singleWindowInterface);

  @override
  Widget frameDecorationBuilder(Widget child, Widget closeButton,
          Widget minimizeButton, Widget maximizeButton) =>
      Container(
        child: Column(
          children: [
            Container(
              height: 20,
              color: Colors.black38,
              child: Row(
                children: [closeButton, maximizeButton, minimizeButton],
              ),
            ),
            child
          ],
        ),
      );
}
