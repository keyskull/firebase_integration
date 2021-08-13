import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_integration/firebase.dart'
    deferred as firebase;
import 'package:intl/intl.dart';

import 'platforms/web_plugins_locator.dart'
// ignore: uri_does_not_exist
    if (dart.library.js) 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'web_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  firebase.loadLibrary().then((value) => firebase.FirebaseIntegration());
  setUrlStrategy(PathUrlStrategy());
  Devicelocale.currentLocale
      .then((value) => Intl.defaultLocale = value ?? 'en');

  runApp(WebApp());
}
