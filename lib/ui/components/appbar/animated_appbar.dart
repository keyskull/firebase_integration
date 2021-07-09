import 'dart:developer';

import 'package:after_layout/after_layout.dart';
import 'package:firebase_integration/ui/components/login_dialog.dart';
import 'package:flutter/material.dart';
import 'package:router/route.dart';
import 'package:utilities/screen_size.dart';

import '../../../properties/common.dart';
import '../../../properties/navigation_content.dart';

class AnimatedAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  @override
  final Size preferredSize;
  final double? toolbarHeight;
  final PreferredSizeWidget? bottom;

  State<AnimatedAppBar> createState() =>
      AnimatedAppBarState(toolbarHeight: toolbarHeight);

  AnimatedAppBar({this.toolbarHeight = appBarHeight, this.bottom})
      : preferredSize = Size.fromHeight(toolbarHeight ??
            kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));
}

class AnimatedAppBarState extends State<AnimatedAppBar>
    with TickerProviderStateMixin, AfterLayoutMixin {
  var toolbarHeight;

  AnimatedAppBarState({this.toolbarHeight});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final actionButton =
        ({required String text, required Function() onPressed}) => TextButton(
              onPressed: onPressed,
              child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    text,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w400),
                  )),
            );

    final appBar = AppBar(
      backgroundColor: Colors.blue,
      leading: Container(
        margin: const EdgeInsets.only(left: 20.0),
        child: const FlutterLogo(),
      ),
      // Icon(
      //   Icons.label_important_rounded,
      //   size: 40,
      //   color: Colors.black,
      // ),
      elevation: 2,
      //titleSpacing: 0.0,
      title: const Text(
        'Numflurry',
        style: const TextStyle(color: Colors.black),
        overflow: TextOverflow.visible,
      ),
      actions: (ScreenSize.isDesktop(context)
          ? [
              actionButton(onPressed: () {}, text: 'Our Story'),
              actionButton(onPressed: () {}, text: 'Memebership'),
              actionButton(onPressed: () {}, text: 'Write'),
              actionButton(
                text: 'Sign in',
                onPressed: () => showDialog(
                    context: globalNavigatorKey.currentContext!,
                    builder: (context) => LoginDialog()),
              ),
              actionButton(onPressed: () {}, text: 'About us'),
            ]
          : []),
    );
    final builder = AnimatedPadding(
        padding: EdgeInsets.only(
            bottom: ScreenSize.getScreenSize.height - toolbarHeight),
        duration: const Duration(milliseconds: 500),
        child: appBar);

    return Semantics(container: true, child: builder);
  }

  _registerNotificationListener() {
    globalNotificationListeners[this.hashCode.toString()] =
        (scrollNotification) {
      if (scrollNotification is ScrollUpdateNotification) {
        final distance = (scrollNotification.scrollDelta ?? 0);
        // log('ScrollUpdateNotification: ' + distance.toString(),
        //     name: 'ml.numflurry.appbar');
        if (distance > 0)
          this.setState(() {
            final counted = toolbarHeight - distance;
            toolbarHeight = counted >= 0 ? counted : 0;
          });
        else {
          this.setState(() {
            toolbarHeight = appBarHeight;
          });
        }
      }
      return true;
    };
    log(
        "globalNotificationListeners:" +
            globalNotificationListeners.keys.join(","),
        name: "globalNotificationListeners");
  }

  @override
  void afterFirstLayout(BuildContext context) {
    _registerNotificationListener();
  }

  @override
  void didUpdateWidget(covariant AnimatedAppBar oldWidget) {
    globalNotificationListeners.remove(oldWidget.hashCode.toString());
    log('AnimatedAppbar deleted oldWidget:' + oldWidget.hashCode.toString());
    _registerNotificationListener();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    globalNotificationListeners.remove(this.hashCode.toString());
    super.dispose();
  }
}
