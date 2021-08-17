import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_display_layer_framework/framework.dart';
import 'package:flutter_universal_router/pages/404.dart';
import 'package:flutter_universal_router/ui/views/direct_interface/loading.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:http/http.dart' as http;

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
