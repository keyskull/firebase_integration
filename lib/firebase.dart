import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cullen_utilities/custom_log_printer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:universal_router/route.dart';

class FirebaseIntegration {
  final logger = Logger(printer: CustomLogPrinter('FirebaseIntegration'));

  static final firebaseAnalytics = FirebaseAnalytics();
  static final auth = FirebaseAuth.instance;
  static final fireStore = FirebaseFirestore.instance;
  initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    UniversalRouter.addRoutePathChangingListeners((routePath) {
      logger.i('RoutePathListeners run.');
      FirebaseIntegration.firebaseAnalytics
          .setCurrentScreen(screenName: routePath.routeName)
          .then((value) => log(
              'firebaseAnalytics.setCurrentScreen(screenName: ${routePath.routeName})',
              name: 'firebaseAnalytics.setCurrentScreen'))
          .catchError(
        (Object error) {
          debugPrint(': $error');
        },
        test: (Object error) => error is PlatformException,
      );
      FirebaseIntegration.firebaseAnalytics.logEvent(name: 'page_view');
    });
    await Firebase.initializeApp();
  }

  FirebaseIntegration() {
    initialize().then((_) {
      firebaseAnalytics.logAppOpen();
      auth.userChanges().listen((User? user) {
        if (user == null) {
          log('User is currently signed out!');
        } else {
          log('User is signed in!');
        }
      });
    });
  }
}
