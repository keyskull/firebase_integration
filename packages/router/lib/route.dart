import 'dart:developer';

import 'package:flutter/material.dart';

import 'init_router_base.dart';
import 'pages/async_loading_page.dart';
import 'route_data.dart';

part 'route_path.dart';

final GlobalKey<NavigatorState> globalNavigatorKey =
    GlobalKey<NavigatorState>();

typedef PageBuilder = Future<Widget> Function(
    String? parameters, dynamic extraInformation);

Widget Function({required Widget child, AppBar? appBar}) decorationLayer =
    ({required Widget child, AppBar? appBar}) => Container(child: child);

AppBar? appBar;

Map<String, RouteInstance> _routeStack = {};

class RouteInstance {
  final String routePath;
  final PageBuilder pageBuilder;
  final String title;
  final String parameters;
  final String path;
  final dynamic extraInformation;

  RouteInstance(
      {required this.routePath,
      required this.pageBuilder,
      String? title,
      this.parameters = '',
      this.extraInformation})
      : path = parameters == ''
            ? '/' + routePath
            : '/' + routePath + '/' + parameters,
        title = title ?? routePath {
    _routeStack[this.path.substring(1)] = this;
  }

  createChildRouteInstance({String parameters = '', dynamic extraInformation}) {
    return new RouteInstance(
        routePath: this.routePath,
        pageBuilder: this.pageBuilder,
        title: this.title,
        parameters: parameters,
        extraInformation: extraInformation);
  }

  RouteInformation getRouteInformation() {
    log("getRouteInformation:" + path, name: 'ml.cullen.router');
    return RouteInformation(location: path);
  }

  Page getPage() {
    log("path:" + routePath, name: 'ml.cullen.router');
    log("parameter:" + parameters, name: 'ml.cullen.router');
    return MaterialPage(
        key: ValueKey(RouteData(
          path: path,
          title: title,
          parameters: parameters,
          routePath: routePath,
        )),
        child: AsyncLoadPage(
            future: pageBuilder(parameters, extraInformation).then(
                (value) => decorationLayer(child: value, appBar: appBar))));
  }
}
