import 'package:flutter/material.dart';

class StackeditDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Dialog(
        child: Scaffold(
          appBar: AppBar(),
          body: HtmlElementView(
            viewType: 'stackedit',
          ),
        ),
      );
}
