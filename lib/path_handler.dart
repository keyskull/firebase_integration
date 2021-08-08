import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'route.dart';

class PathHandler extends ChangeNotifier {
  String _routeName = "";

  get routeName => _routeName;

  void changePath(String path) {
    _routeName = path;
    log('routeName:' + routeName, name: 'ml.cullen.router.PathHandler');
    final routePathInstance = RoutePath(routeName: path).getRouteInstance;
    SystemChrome.setApplicationSwitcherDescription(
        ApplicationSwitcherDescription(
      label: routePathInstance.title,
      primaryColor: 0,
    ));

    notifyListeners();
  }
}
