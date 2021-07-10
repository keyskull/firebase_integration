import 'package:flutter/material.dart';

class WebSingleChildScrollView extends StatelessWidget {
  final Widget child;
  final Key? key;

  WebSingleChildScrollView({this.key, required this.child});

  @override
  Widget build(BuildContext context) =>
      SingleChildScrollView(key: key, child: child);
}
