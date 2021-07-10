import 'package:cullen/ui/components/bottom/footer.dart';
import 'package:flutter/material.dart';
import 'package:universal_scroll_view/universal_single_child_scroll_view.dart';

abstract class DirectInterface implements Widget {
  bool isScrollable();
}

class WindowLayer extends StatelessWidget {
  final DirectInterface child;

  WindowLayer({required this.child});

  @override
  Widget build(BuildContext context) {
    if (child.isScrollable())
      return UniversalSingleChildScrollView(
        child: Column(
          children: [child, Footer()],
        ),
      );
    else {
      return Column(
        children: [child, Footer()],
      );
    }
  }
}
