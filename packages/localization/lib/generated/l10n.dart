// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Contact Information`
  String get contact_information {
    return Intl.message(
      'Contact Information',
      name: 'contact_information',
      desc: '',
      args: [],
    );
  }

  /// `Quick Access`
  String get quick_access {
    return Intl.message(
      'Quick Access',
      name: 'quick_access',
      desc: '',
      args: [],
    );
  }

  /// `Jialin Li's Portfolio`
  String get home_page_name {
    return Intl.message(
      'Jialin Li\'s Portfolio',
      name: 'home_page_name',
      desc: '',
      args: [],
    );
  }

  /// `login`
  String get login {
    return Intl.message(
      'login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Cookie Policy`
  String get cookie_policy {
    return Intl.message(
      'Cookie Policy',
      name: 'cookie_policy',
      desc: '',
      args: [],
    );
  }

  /// `Disclaimer`
  String get disclaimer {
    return Intl.message(
      'Disclaimer',
      name: 'disclaimer',
      desc: '',
      args: [],
    );
  }

  /// `Legal`
  String get legal {
    return Intl.message(
      'Legal',
      name: 'legal',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get terms_of_service {
    return Intl.message(
      'Terms of Service',
      name: 'terms_of_service',
      desc: '',
      args: [],
    );
  }

  /// `Life History`
  String get life_history {
    return Intl.message(
      'Life History',
      name: 'life_history',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Jialin's Portfolio.\n\nI'm Jialin Li, a person who passionate about life-long learning and sharing knowledge with my understanding.\nExperienced in Back-end engineer and Full-stack developer position; bestowed Bachelor's degree in Computer Science; studying the Data Science program, and working on some projects related. I am looking for new opportunities to contribute my service systems development and design experiences as a software engineer with my passion and seeking a good approach to leverage my skill in Data Science.\n\nFeel free to chat with me about anything you're interested in.\n\nYou can contact me via the contact button.\n`
  String get header_description {
    return Intl.message(
      'Welcome to Jialin\'s Portfolio.\n\nI\'m Jialin Li, a person who passionate about life-long learning and sharing knowledge with my understanding.\nExperienced in Back-end engineer and Full-stack developer position; bestowed Bachelor\'s degree in Computer Science; studying the Data Science program, and working on some projects related. I am looking for new opportunities to contribute my service systems development and design experiences as a software engineer with my passion and seeking a good approach to leverage my skill in Data Science.\n\nFeel free to chat with me about anything you\'re interested in.\n\nYou can contact me via the contact button.\n',
      name: 'header_description',
      desc: '',
      args: [],
    );
  }

  /// `Jialin Li's Portfolio`
  String get title {
    return Intl.message(
      'Jialin Li\'s Portfolio',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Jialin Li's Portfolio © 2021 by Jialin Li is licensed under Attribution-NonCommercial-ShareAlike 4.0 International. To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/`
  String get license_announcement {
    return Intl.message(
      'Jialin Li\'s Portfolio © 2021 by Jialin Li is licensed under Attribution-NonCommercial-ShareAlike 4.0 International. To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/',
      name: 'license_announcement',
      desc: '',
      args: [],
    );
  }

  /// `About Me`
  String get about_me {
    return Intl.message(
      'About Me',
      name: 'about_me',
      desc: '',
      args: [],
    );
  }

  /// `About the Webpages`
  String get about_the_webpages {
    return Intl.message(
      'About the Webpages',
      name: 'about_the_webpages',
      desc: '',
      args: [],
    );
  }

  /// `Website`
  String get website {
    return Intl.message(
      'Website',
      name: 'website',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `My Github`
  String get my_github {
    return Intl.message(
      'My Github',
      name: 'my_github',
      desc: '',
      args: [],
    );
  }

  /// `My Linkedin Profile`
  String get my_linkedin_profile {
    return Intl.message(
      'My Linkedin Profile',
      name: 'my_linkedin_profile',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Service Statuses`
  String get service_statuses {
    return Intl.message(
      'Service Statuses',
      name: 'service_statuses',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get services {
    return Intl.message(
      'Services',
      name: 'services',
      desc: '',
      args: [],
    );
  }

  /// `Recent Projects`
  String get recent_projects {
    return Intl.message(
      'Recent Projects',
      name: 'recent_projects',
      desc: '',
      args: [],
    );
  }

  /// `Contact Me`
  String get contact_me {
    return Intl.message(
      'Contact Me',
      name: 'contact_me',
      desc: '',
      args: [],
    );
  }

  /// `Newest Articles`
  String get newest_articles {
    return Intl.message(
      'Newest Articles',
      name: 'newest_articles',
      desc: '',
      args: [],
    );
  }

  /// `Website Status`
  String get website_status {
    return Intl.message(
      'Website Status',
      name: 'website_status',
      desc: '',
      args: [],
    );
  }

  /// `Blog`
  String get blog {
    return Intl.message(
      'Blog',
      name: 'blog',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get blog_description {
    return Intl.message(
      '',
      name: 'blog_description',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
