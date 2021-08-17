import 'dart:developer';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_display_layer_framework/framework.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_universal_router/init_router_base.dart';
import 'package:flutter_universal_router/route.dart';
import 'package:localization/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:utilities/screen_size.dart';

import 'init_router.dart';

class WebApp extends StatefulWidget {
  @override
  _WebAppState createState() => _WebAppState();
}

class _WebAppState extends State<WebApp> with AfterLayoutMixin {
  String title = '';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //using Provider, don't need to add handler to constructors of all descendants
      create: (context) => PathHandler(),
      child: MaterialApp.router(
        title: title,
        routerDelegate: RouterDelegateInherit(),
        routeInformationParser: RouteInformationParserInherit(),
        builder: (context, Widget? child) {
          ScreenSize.initScreenSize(context);
          InitRouter(context);
          final unknown =
              (InitRouterBase.unknownPage.getPage() as MaterialPage).child;
          log("${child.runtimeType.toString()}");

          return Overlay(
            initialEntries: [
              OverlayEntry(
                  builder: (context) =>
                      NavigationLayer(child: child ?? unknown)),
            ],
          );
        },
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale!.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    setState(() {
      title = S.current.title;
    });
  }
}
