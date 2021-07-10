import 'package:flutter/cupertino.dart';

import 'platforms/universal_single_child_scroll_view_locator.dart'
    // ignore: uri_does_not_exist
    if (dart.library.js) "browser_supported_single_child_scroll_view.dart";

class UniversalSingleChildScrollView extends StatelessWidget {
  final child;
  final Key? key;

  UniversalSingleChildScrollView({this.key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      WebSingleChildScrollView(key: key, child: child);
}
