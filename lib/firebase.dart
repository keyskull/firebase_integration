import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseIntegration {
  static final firebaseAnalytics = FirebaseAnalytics();
  static final auth = FirebaseAuth.instance;
  _init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  FirebaseIntegration() {
    _init().then((_){
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
