import 'dart:developer';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localization/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:router/path_handler.dart';
import 'package:router/route.dart';
import 'package:router/route_data.dart';

import '../../properties/common.dart';
import '../../properties/navigation_content.dart';
import '../components/bottom/bar/cookiebar.dart';
import '../components/bottom/bar/license_information_bottom_bar.dart';

void _func() {}

class DecorationLayer extends StatefulWidget {
  final Widget child;
  final AppBar? appBar;
  DecorationLayer({required this.child, this.appBar});

  @override
  State<StatefulWidget> createState() =>
      DecorationLayerState(child: child, appBar: appBar);
}

class DecorationLayerState extends State<DecorationLayer>
    with TickerProviderStateMixin, AfterLayoutMixin {
  final Widget child;
  final AppBar? appBar;

  DecorationLayerState({required this.child, this.appBar});

  var _appBarHeight = appBarHeight;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final actionButton =
        ({required String text, Function() onPressed = _func}) => TextButton(
              onPressed: onPressed,
              child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    text,
                    // overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w400),
                  )),
            );
    final routeData =
        ((globalNavigatorKey.currentState!.widget.pages.first.key as ValueKey)
            .value as RouteData);

    final appBar = this.appBar ??
        AppBar(
            toolbarHeight: _appBarHeight,
            backwardsCompatibility: true,
            backgroundColor: mainThemeColor,
            leading: Container(
                margin: const EdgeInsets.only(left: 20.0),
                child: routeData.isRoot()
                    ? const Image(image: AssetImage("images/logo.png"))
                    : BackButton(
                        onPressed: () =>
                            Provider.of<PathHandler>(context, listen: false)
                                .changePath(routeData.routePath),
                      )),
            elevation: 2,
            titleSpacing: 5.0,
            title: Text(
              S.of(context).title,
              // style: const TextStyle(color: Colors.black),
              overflow: TextOverflow.visible,
            ),
            actions: [
              actionButton(
                  onPressed: () =>
                      Provider.of<PathHandler>(context, listen: false)
                          .changePath("about-me"),
                  text: 'About Me')
            ]);
    return Scaffold(
      appBar: appBar,
      body: Stack(
          alignment: Alignment.topCenter,
          children: [child, LicenseInformationBottomBar(), CookieBar()]),
    );
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
