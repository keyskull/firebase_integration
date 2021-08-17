import 'package:cullen/init_router.dart';
import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_display_layer_framework/framework.dart';
import 'package:flutter_display_layer_framework/multi_layered_app.dart';
import 'package:flutter_firebase_integration/firebase.dart'
    deferred as firebase;
import 'package:intl/intl.dart';

import 'platforms/web_plugins_locator.dart'
// ignore: uri_does_not_exist
    if (dart.library.js) 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  firebase.loadLibrary().then((value) => firebase.FirebaseIntegration());
  setUrlStrategy(PathUrlStrategy());
  Devicelocale.currentLocale
      .then((value) => Intl.defaultLocale = value ?? 'en');

  const buttonPaths = [
    '',
    'dashboard',
    'blog',
    'projects',
    'tools',
    'notebook',
    'about-me'
  ];
  const buttonNames = [
    'Home',
    'Dashboard',
    'Blog',
    'Projects',
    'Tools',
    'Notebook',
    'About Me'
  ];
  const buttonIcons = [
    const Icon(Icons.home),
    const Icon(Icons.dashboard),
    const Icon(Icons.article),
    const Icon(Icons.work),
    const Icon(Icons.build_circle),
    const Icon(Icons.book),
    const Icon(Icons.album)
  ];
  const buttonSelectedIcons = [
    const Icon(Icons.home_outlined),
    const Icon(Icons.dashboard_outlined),
    const Icon(Icons.article_outlined),
    const Icon(Icons.work_outline),
    const Icon(Icons.build_circle_outlined),
    const Icon(Icons.book_outlined),
    const Icon(Icons.album_outlined)
  ];

  mainThemeColor = Colors.black;

  final Map<int, Color> color = {
    50: Color.fromRGBO(0, 0, 0, .1),
    100: Color.fromRGBO(0, 0, 0, .2),
    200: Color.fromRGBO(0, 0, 0, .3),
    300: Color.fromRGBO(0, 0, 0, .4),
    400: Color.fromRGBO(0, 0, 0, .5),
    500: Color.fromRGBO(0, 0, 0, .6),
    600: Color.fromRGBO(0, 0, 0, .7),
    700: Color.fromRGBO(0, 0, 0, .8),
    800: Color.fromRGBO(0, 0, 0, .9),
    900: Color.fromRGBO(0, 0, 0, 1),
  };

  runApp(MultiLayeredApp(
    initProcess: (context) {
      InitRouter(context);
    },
    navigationLayerBuilder: (child) => new NavigationLayer(
      child: child,
      navigationRailButtons: NavigationRailButtons(
          buttonPaths, buttonNames, buttonIcons, buttonSelectedIcons),
      defaultNavigationSelectedIndex: 0,
    ),
    theme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(
      primarySwatch: MaterialColor(Colors.black.value, color),
      accentColor: Colors.lime,
    )),
  ));
}
