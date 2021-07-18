import 'package:flutter/material.dart';
import 'package:localization/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:router/path_handler.dart';
import 'package:router/route.dart';
import 'package:router/route_data.dart';

import 'decoration_layer.dart';
import 'navigation_layer.dart';
import 'properties/common.dart';
import 'windows/window_layer.dart';

void _func() {}
AppBar? _defaultAppBarBuilder(double appBarHeight, BuildContext context) =>
    null;

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

final appBarBuilder = (double appBarHeight, BuildContext context) => AppBar(
        toolbarHeight: appBarHeight,
        backwardsCompatibility: true,
        backgroundColor: mainThemeColor,
        leading: Container(
            margin: const EdgeInsets.only(left: 20.0),
            child: ((globalNavigatorKey.currentState?.widget.pages.first.key
                            as ValueKey)
                        .value as RouteData)
                    .isRoot()
                ? const Image(image: AssetImage("images/logo.png"))
                : BackButton(
                    onPressed: () => globalNavigatorKey.currentState?.pop(),
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
              onPressed: () => Provider.of<PathHandler>(context, listen: false)
                  .changePath("about-me"),
              text: 'About Me')
        ]);

class Framework {
  static final Widget Function({required Widget child}) windowLayer =
      ({required Widget child}) => WindowLayer(child: child);

  static final Widget Function({required Widget child}) decorationLayer = (
          {required Widget child}) =>
      DecorationLayer(child: child, appBarBuilder: appBarBuilder);

  static final Widget Function({required Widget child}) navigationLayer =
      ({required Widget child}) => NavigationLayer(child: child);
}
