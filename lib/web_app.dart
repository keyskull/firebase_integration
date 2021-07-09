import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:router/init_router_base.dart';
import 'package:router/path_handler.dart';
import 'package:router/route_information_parser.dart';
import 'package:router/router_delegate.dart';
import 'package:utilities/screen_size.dart';

import 'init_router.dart';
import 'ui/views/navigation_layer.dart';

class WebApp extends StatefulWidget {
  @override
  _WebAppState createState() => _WebAppState();
}

class _WebAppState extends State<WebApp> with AfterLayoutMixin {
  String title = '';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PathHandler>(
      //using Provider, don't need to add handler to constructors of all descendants
      create: (_) => PathHandler(),
      child: MaterialApp.router(
        title: title,
        routerDelegate: RouterDelegateInherit(),
        routeInformationParser: RouteInformationParserInherit(),
        builder: (context, Widget? child) {
          ScreenSize.initScreenSize(context);
          InitRouter(context);
          return NavigationLayer(
              child: child ??
                  (InitRouterBase.unknownPage.getPage() as MaterialPage).child);
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
