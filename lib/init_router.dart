import 'package:cullen/ui/views/direct_interface/html_editor.dart';
import 'package:firebase_integration/ui/views/login.dart' deferred as login;
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:localization/generated/l10n.dart';
import 'package:router/route.dart';
import 'package:web_browser/web_browser.dart' deferred as web_browser;

import 'tools/html_to_page.dart' deferred as htmlToPage;
import 'ui/views/decoration_layer.dart';
import 'ui/views/direct_interface/about_me.dart' deferred as aboutMe;
import 'ui/views/direct_interface/blog/article_page.dart' deferred as article;
import 'ui/views/direct_interface/blog/blog_page.dart' deferred as blog;
import 'ui/views/direct_interface/contact.dart' deferred as contact;
import 'ui/views/direct_interface/dashboard.dart' deferred as dashboard;
import 'ui/views/direct_interface/home.dart' deferred as home;
import 'ui/views/direct_interface/projects.dart' deferred as projects;
import 'ui/views/direct_interface/tools.dart' deferred as tools;
import 'ui/views/navigation_layer.dart';
import 'ui/views/window_layer.dart';

class InitRouter {
  final blogBuilder = ((parameters, _) => parameters == ''
      ? blog.loadLibrary().then((_) => blog.BlogPage())
      : article
          .loadLibrary()
          .then((_) => article.Article(path: parameters ?? '')));

  InitRouter(BuildContext context) {
    windowsLayer = ({required Widget child}) => WindowsLayer(
          child: child,
        );
    navigationLayer = ({required Widget child, AppBar? appBar}) =>
        NavigationLayer(child: child);
    decorationLayer = ({required Widget child, AppBar? appBar}) =>
        DecorationLayer(child: child, appBar: appBar);

    RouteInstance(
        routePath: "",
        title: S.of(context).home_page_name,
        pageBuilder: (_, __) =>
            home.loadLibrary().then((value) => home.Home()));
    RouteInstance(
        routePath: "home",
        title: S.of(context).home_page_name,
        pageBuilder: (_, __) =>
            home.loadLibrary().then((value) => home.Home()));
    RouteInstance(routePath: "blog", title: 'Blog', pageBuilder: blogBuilder);

    RouteInstance(
        routePath: "about-me",
        title: S.of(context).about_me,
        pageBuilder: (_, __) =>
            aboutMe.loadLibrary().then((value) => aboutMe.AboutMe()));

    RouteInstance(
        routePath: "contact",
        title: 'Contact',
        pageBuilder: (_, __) =>
            contact.loadLibrary().then((value) => contact.Contact()));

    RouteInstance(
        routePath: "disclaimer",
        title: 'Disclaimer',
        pageBuilder: (_, __) => htmlToPage
            .loadLibrary()
            .then((value) => htmlToPage.HtmlToPage(path: 'disclaimer.html')));

    RouteInstance(
        routePath: "cookie-policy",
        title: 'Cookie Policy',
        pageBuilder: (_, __) => htmlToPage.loadLibrary().then(
            (value) => htmlToPage.HtmlToPage(path: 'cookie-policy.html')));

    // RouteInstance(
    //     routePath: "test",
    //     pageBuilder: (_, __) async {
    //       // ignore: undefined_prefixed_name
    //       ui.platformViewRegistry.registerViewFactory(
    //           'hello-world-html',
    //           (int viewId) => IFrameElement()
    //             ..width = '640'
    //             ..height = '360'
    //             ..src = 'https://www.youtube.com/embed/IyFZznAk69U'
    //             ..style.border = 'none');
    //       return HtmlElementView(viewType: 'hello-world-html');
    //     });

    RouteInstance(
        routePath: "markdown",
        title: 'Narkdown',
        pageBuilder: (_, __) async =>
            Markdown(data: "dadasdasdadsssssssssssssssss"));
    RouteInstance(
        routePath: "editor",
        title: 'Editor',
        pageBuilder: (_, __) async => HtmlEditorExample(
              title: "dasdadada",
            ));
    RouteInstance(
        routePath: "dashboard",
        title: 'Dashboard',
        pageBuilder: (_, __) =>
            dashboard.loadLibrary().then((value) => dashboard.Dashboard()));

    RouteInstance(
        routePath: "projects",
        title: 'Projects',
        pageBuilder: (_, __) =>
            projects.loadLibrary().then((value) => projects.Projects()));

    RouteInstance(
        routePath: "tools",
        title: 'Tools',
        pageBuilder: (_, __) =>
            tools.loadLibrary().then((value) => tools.Tools()));

    RouteInstance(
        routePath: 'web_browser',
        pageBuilder: (_, __) => web_browser.loadLibrary().then((value) =>
            web_browser.WebBrowser(
                interactionSettings:
                    new web_browser.WebBrowserInteractionSettings(
                        topBar: null,
                        bottomBar: null,
                        gestureNavigationEnabled: true,
                        initialMediaPlaybackPolicy:
                            web_browser.AutoMediaPlaybackPolicy.always_allow),
                initialUrl: 'https://baidu.com',
                javascriptEnabled: true)));

    RouteInstance(
        routePath: 'login',
        title: S.of(context).login,
        pageBuilder: (_, __) =>
            login.loadLibrary().then((value) => login.Login()));

    RouteInstance(
        routePath: 'data-request',
        pageBuilder: (_, __) async {
          return Column();
        });
  }
}
