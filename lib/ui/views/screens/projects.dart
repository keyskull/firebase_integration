import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_display_layer_framework/framework.dart';
import 'package:flutter_universal_router/pages/404.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:utilities/custom_log_printer.dart';

class Projects extends StatelessWidget with SingleWindowInterfaceMixin {
  @override
  Widget build(BuildContext context) {
    final logger = Logger(printer: CustomLogPrinter('Projects'));
    return FutureBuilder(
      future: http
          .get(Uri.parse(
              "https://api.onedrive.com/v1.0/shares/s!AEGheyPehZ6ZjKk8/driveItem"))
          .then((value) => http.get(Uri.parse(
              jsonDecode(value.body)["@content.downloadUrl"] as String))),
      builder: (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            logger.e(snapshot.error.toString());
            return UnknownScreen(errorMSG: snapshot.error.toString());
          } else {
            // logger.i(Utf8Decoder().convert(snapshot.requireData.bodyBytes));

            return Column(
              children: LineSplitter()
                  .convert(ascii.decode(utf8.encode(snapshot.requireData.body)))
                  .map((e) => Text(e))
                  .toList(),
            );
          }
        } else
          return CircularProgressIndicator();
      },
    );
  }

  @override
  bool scrollable() => true;
}
