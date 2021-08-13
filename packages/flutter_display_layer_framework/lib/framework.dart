import 'dart:developer';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_universal_router/route.dart';
import 'package:localization/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:utilities/screen_size.dart';

import '/widgets/custom_navigation_rail.dart';
import '/windows/window_layer.dart';
import 'widgets/bottom/bar/license_information_bottom_bar.dart';
import 'widgets/floating_action_button.dart';

part 'decoration_layer.dart';
part 'navigation_layer.dart';

void _func() {}

const _edgeInsetsAll = EdgeInsets.all(20.0);
const double _articleItemHeight = 133;
const _articleItemAlignment = CrossAxisAlignment.start;
const _descriptionEdgeInsets = EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0);
const double _appBarHeight = 50;
const _mainThemeColor = Colors.blue;

EdgeInsets edgeInsetsAll = _edgeInsetsAll;
double articleItemHeight = _articleItemHeight;
CrossAxisAlignment articleItemAlignment = _articleItemAlignment;
EdgeInsets descriptionEdgeInsets = _descriptionEdgeInsets;
double appBarHeight = _appBarHeight;
MaterialColor mainThemeColor = _mainThemeColor;

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

final defaultAppBarBuilder = (double appBarHeight, BuildContext context) =>
    AppBar(
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

AppBar Function(double, BuildContext) appBarBuilder = defaultAppBarBuilder;

setAppbarBuilder(AppBar Function(double, BuildContext) newAppBarBuilder) =>
    appBarBuilder = newAppBarBuilder;
