import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_universal_router/route.dart' as router;

class FirebaseIntegration {
  static final firebaseAnalytics = FirebaseAnalytics();
  static final auth = FirebaseAuth.instance;
  static final fireStore = FirebaseFirestore.instance;
  initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    router.addRoutePathListeners((routePath) {
      FirebaseIntegration.firebaseAnalytics
          .setCurrentScreen(
              screenName: routePath.routeName,
              screenClassOverride:
                  routePath.getRouteInstance.getPage().runtimeType.toString())
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
          print('User is currently signed out!');
        } else {
          print('User is signed in!');
        }
      });
    });
  }
}
