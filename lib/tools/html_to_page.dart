import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:framework/windows/window_layer.dart';
import 'package:http/http.dart' as http;
import 'package:router/pages/404.dart';
import 'package:router/ui/views/direct_interface/loading.dart';

class HtmlToPage extends StatelessWidget with SingleWindowInterfaceMixin {
  final String path;

  HtmlToPage({required this.path});

  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: http.get(Uri.parse(path)).then((value) => Padding(
          padding: const EdgeInsets.all(8.0), child: HtmlWidget(value.body))),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            log(snapshot.error.toString(),
                level: 2000,
                name: 'ml.cullen.router.loading',
                error: snapshot.error);
            return UnknownScreen(errorMSG: snapshot.error.toString());
          } else
            return snapshot.requireData as Widget;
        } else
          return Loading();
      });

  @override
  bool scrollable() => true;
}
