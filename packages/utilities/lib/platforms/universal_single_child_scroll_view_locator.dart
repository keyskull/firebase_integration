import 'package:flutter/material.dart';

class BrowserSupportedSingleChildScrollView extends StatelessWidget {
  final Widget child;
  final Key? key;

  BrowserSupportedSingleChildScrollView({this.key,required this.child});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(key: key, child: child);

}