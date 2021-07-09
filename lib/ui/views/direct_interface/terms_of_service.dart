import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:utilities/widgets/scroll_view/universal_single_child_scroll_view.dart';
import 'package:router/pages/404.dart';
import 'package:router/ui/views/direct_interface/loading.dart';
import 'package:http/http.dart' as http;

class TermsOfService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: http.get(Uri.parse('terms-of-service.html')).then((value) =>
            UniversalSingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:HtmlWidget(value.body)))
        ),
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
  }
}
