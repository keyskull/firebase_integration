import 'package:flutter/material.dart';
import 'package:framework/windows/window_layer.dart';
import 'package:markdown_editor/markdown_editor.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:utilities/screen_size.dart';

final floatingActionButtons = (context,
        {required Function() switchNavigatorRailState,
        required Function() switchContactButtonState,
        required bool hiddenNavigation,
        required bool contactButtonExtended,
        Dialog contactButtonDialog = const Dialog()}) =>
    Opacity(
      opacity: 0.7,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Padding(
              padding:
                  EdgeInsets.only(right: ScreenSize.getScreenSize.width - 85),
              child: PointerInterceptor(
                  child: FloatingActionButton(
                onPressed: () {
                  switchNavigatorRailState();
                },
                child: hiddenNavigation
                    ? Icon(Icons.arrow_forward_ios_outlined)
                    : Icon(Icons.arrow_back_ios_outlined),
                heroTag: "hidden",
              ))),
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            PointerInterceptor(
                child: FloatingActionButton(
              mini: true,
              onPressed: () {
                switchContactButtonState();
                launch("mailto:contact@numflurry.ml");
              },
              child: contactButtonExtended
                  ? Icon(Icons.email)
                  : Icon(Icons.email_outlined),
              backgroundColor: Colors.blue,
              heroTag: "btn2",
            )),
            SizedBox(height: 10),
            PointerInterceptor(
                child: FloatingActionButton(
              mini: true,
              onPressed: () {
                switchContactButtonState();

                windowContainer.openWindow(InstanceBuilder((id) =>
                    SingleWindowInterfaceMixin.buildWithSingleWindowInterface(
                      id,
                      MarkdownEditor(),
                    )));
              },
              child: contactButtonExtended
                  ? Icon(Icons.message)
                  : Icon(Icons.message_outlined),
              backgroundColor: Colors.blue,
            ))
          ])
        ],
      ),
    );
