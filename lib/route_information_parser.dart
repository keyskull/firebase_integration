import 'dart:developer';

import 'package:flutter/material.dart';

// import 'package:flutter/services.dart';
import 'route.dart';

// import 'package:firebase_integration/firebase.dart';

class RouteInformationParserInherit extends RouteInformationParser<RoutePath> {
  @override
  Future<RoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    log('routeInformation.location = ' + (routeInformation.location ?? '/'),
        name: 'ml.cullen.router.RouteInformationParserInherit');
    return RoutePath(routeName: routeInformation.location ?? '/');
  }

  @override
  RouteInformation restoreRouteInformation(RoutePath routePath) {
    log('restoreRouteInformation = ' + routePath.routeName,
        name: 'ml.cullen.router.RouteInformationParserInherit');
    log(
        'routePath.getRouteInstance.getRouteInformation().location = ' +
            (routePath.getRouteInstance.getRouteInformation().location ?? ''),
        name: 'ml.cullen.router.RouteInformationParserInherit');
    log(
        'routePath.getRouteInstance.getRouteInformation().state = ' +
            routePath.getRouteInstance.getRouteInformation().state.toString(),
        name: 'ml.cullen.router.RouteInformationParserInherit');

    // FirebaseIntegration.firebaseAnalytics
    //     .setCurrentScreen(
    //         screenName: routePath.routeName,
    //         screenClassOverride:
    //             routePath.getRouteInstance.getPage().runtimeType.toString())
    //     .then((value) => log(
    //         'firebaseAnalytics.setCurrentScreen(screenName: ${routePath.routeName})',
    //         name: 'firebaseAnalytics.setCurrentScreen'))
    //     .catchError(
    //   (Object error) {
    //     debugPrint(': $error');
    //   },
    //   test: (Object error) => error is PlatformException,
    // );
    // FirebaseIntegration.firebaseAnalytics.logEvent(name: 'page_view');

    return routePath.getRouteInstance.getRouteInformation();
  }
}
