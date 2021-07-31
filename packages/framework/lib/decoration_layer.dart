import 'dart:developer';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../properties/common.dart';
import '../properties/navigation_content.dart';
import 'widgets/bottom/bar/license_information_bottom_bar.dart';

class DecorationLayer extends StatefulWidget {
  final Widget child;
  final AppBar? Function(double appBarHeight, BuildContext context)
      appBarBuilder;
  final List<Widget> decorations;

  DecorationLayer(
      {Key? key,
      required this.child,
      required this.appBarBuilder,
      this.decorations = const []})
      : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      DecorationLayerState(child, appBarBuilder, decorations);
}

class DecorationLayerState extends State<DecorationLayer>
    with TickerProviderStateMixin, AfterLayoutMixin {
  final Widget child;
  final AppBar? Function(double appBarHeight, BuildContext context)
      appBarBuilder;
  List<Widget> decorations;

  DecorationLayerState(this.child, this.appBarBuilder, this.decorations);

  var _appBarHeight = appBarHeight;

  @override
  void initState() {
    decorations = decorations + [LicenseInformationBottomBar()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBuilder(_appBarHeight, context),
      body: Stack(
          alignment: Alignment.topCenter,
          children: [_notificationListener(child), ...decorations]),
    );
  }

  _notificationListener(child) => NotificationListener<Notification>(
      onNotification: (notification) {
        return !globalNotificationListeners.values
            .map((e) => e(notification))
            .contains(false);
      },
      child: child);

  _registerNotificationListener() {
    globalNotificationListeners[this.hashCode.toString()] =
        (scrollNotification) {
      if (scrollNotification is ScrollUpdateNotification) {
        final distance = (scrollNotification.scrollDelta ?? 0);
        // log('ScrollUpdateNotification: ' + distance.toString(),
        //     name: 'ml.numflurry.appbar');
        if (distance > 0)
          this.setState(() {
            final counted = _appBarHeight - distance;
            _appBarHeight = counted >= 0 ? counted : 0;
          });
        else if (!scrollNotification.metrics.outOfRange &&
            scrollNotification.metrics.pixels !=
                scrollNotification.metrics.maxScrollExtent) {
          final controller = AnimationController(
              duration: const Duration(milliseconds: 200), vsync: this);
          final animation =
              Tween<double>(begin: _appBarHeight, end: appBarHeight)
                  .animate(controller);
          animation.addListener(() {
            this.setState(() {
              _appBarHeight = animation.value;
            });
          });
          controller.forward();
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
  void didUpdateWidget(covariant DecorationLayer oldWidget) {
    globalNotificationListeners.remove(oldWidget.hashCode.toString());
    log('Decoration Layer deleted oldWidget:' + oldWidget.hashCode.toString());
    _registerNotificationListener();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    globalNotificationListeners.remove(this.hashCode.toString());
    super.dispose();
  }
}
