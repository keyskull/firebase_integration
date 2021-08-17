import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_display_layer_framework/framework.dart';
import 'package:flutter_universal_router/pages/404.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:utilities/custom_log_printer.dart';

class Notebook extends StatefulWidget with SingleWindowInterfaceMixin {
  final String path;

  Notebook({Key? key, this.path = ""}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NotebookState(path);

  @override
  bool scrollable() => true;
}

class NotebookState extends State<Notebook> {
  final String path;

  NotebookState(this.path);

  final logger = Logger(printer: CustomLogPrinter('Dashboard'));

  Widget content = Column();

  @override
  Widget build(BuildContext context) {
    final authKey = "%21AGY6_ztDygzI5NM";
    final mainResId = "999E85DE237BA141%21215929";
    sharingUrl(String authKey, String resid) =>
        "https://onedrive.live.com/redir?resid=$resid&authKey=$authKey";
    String encoderUrl(String url) =>
        "u!" + Base64Codec().encode(Utf8Encoder().convert(url));

    final mainPath = encoderUrl(sharingUrl(authKey, mainResId));
    logger.i(mainPath);

    final menu = FutureBuilder(
      future: http.get(Uri.parse(
          "https://api.onedrive.com/v1.0/shares/s!AEGheyPehZ6ZjZcb/driveItem/children?select=name,webUrl")),
      builder: (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            logger.e(snapshot.error.toString());
            return UnknownScreen(errorMSG: snapshot.error.toString());
          } else {
            final notes = jsonDecode(
                    ((snapshot.requireData as http.Response).body))["value"]
                as List<dynamic>;
            logger.i("note count:" + notes.length.toString());
            return Column(
              children: [
                ...List.generate(notes.length, (index) {
                  return TextButton(
                      onPressed: () {
                        // logger.i(notes[index]["remoteItem"]["id"]);
                        setState(() {
                          // launch(notes[index]["webUrl"]);
                          logger.i(
                              notes[index]["webUrl"].toString().substring(18));
                          content = FutureBuilder(
                              future: http.get(Uri.parse(
                                  "https://api.onedrive.com/v1.0/shares/${notes[index]["webUrl"].toString().substring(18)}/driveItem/children?select=name,webUrl")),
                              builder: (BuildContext context,
                                  AsyncSnapshot<http.Response> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  if (snapshot.hasError) {
                                    logger.e(snapshot.error.toString());
                                    return UnknownScreen(
                                        errorMSG: snapshot.error.toString());
                                  } else {
                                    final notes = jsonDecode(
                                        ((snapshot.requireData as http.Response)
                                            .body))["value"] as List<dynamic>;
                                    logger.i("note count:" +
                                        notes.length.toString());
                                    return Column(
                                      children: List.generate(
                                          notes.length,
                                          (index) =>
                                              Text(notes[index]["name"])),
                                    );
                                  }
                                } else
                                  return CircularProgressIndicator();
                              });
                        });
                      },
                      child: Text(notes[index]["name"]));
                }),
                content
                // ...List.generate(notes.length, (index) {
                //   // logger.i(notes[index]["id"]);
                //   final noteId =
                //       encoderUrl(sharingUrl(authKey, notes[index]["id"]));
                //   logger.i(noteId);
                //
                //   return FutureBuilder(
                //     future: http.get(Uri.parse(
                //         "https://api.onedrive.com/v1.0/shares/$noteId/driveItem?\$expand=children")),
                //     builder: (BuildContext context,
                //         AsyncSnapshot<http.Response> snapshot) {
                //       if (snapshot.connectionState == ConnectionState.done) {
                //         if (snapshot.hasError) {
                //           logger.e(snapshot.error.toString());
                //           return UnknownScreen(
                //               errorMSG: snapshot.error.toString());
                //         } else {
                //           return Column(
                //               children: ((jsonDecode(snapshot.requireData.body)[
                //                       "children"]) as List<dynamic>)
                //                   .takeWhile(
                //                       (e) => e["@content.downloadUrl"] != null)
                //                   .map((e) => Text(e["@content.downloadUrl"]))
                //                   .toList());
                //         }
                //       } else
                //         return CircularProgressIndicator();
                //     },
                //   );
                // })
              ],
            );
          }
        } else
          return CircularProgressIndicator();
      },
    );
    final view = Container(
        color: Colors.white60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: menu,
            ),
            VerticalDivider(
              thickness: 50,
              color: Colors.black,
            ),
            Flexible(
                fit: FlexFit.loose,
                flex: 5,
                child: Container(
                  width: 1000,
                  height: 1000,
                  color: Colors.amber,
                ))
          ],
        ));
    return view;
  }
}
