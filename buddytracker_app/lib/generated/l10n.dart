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

  /// `Welcome to Our App!`
  String get welcomeTitle {
    return Intl.message(
      'Welcome to Our App!',
      name: 'welcomeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Let's get started by setting up your account.`
  String get welcomeSubtitle {
    return Intl.message(
      'Let\'s get started by setting up your account.',
      name: 'welcomeSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `No existing account linked to this device.`
  String get noAccountFound {
    return Intl.message(
      'No existing account linked to this device.',
      name: 'noAccountFound',
      desc: '',
      args: [],
    );
  }

  /// `Please choose one of the following options to continue:`
  String get chooseOption {
    return Intl.message(
      'Please choose one of the following options to continue:',
      name: 'chooseOption',
      desc: '',
      args: [],
    );
  }

  /// `Register with Username and Password`
  String get registerUsernamePassword {
    return Intl.message(
      'Register with Username and Password',
      name: 'registerUsernamePassword',
      desc: '',
      args: [],
    );
  }

  /// `Register Anonymously (Device only)`
  String get registerAnonymously {
    return Intl.message(
      'Register Anonymously (Device only)',
      name: 'registerAnonymously',
      desc: '',
      args: [],
    );
  }

  /// `Log In with Existing Account`
  String get loginExisting {
    return Intl.message(
      'Log In with Existing Account',
      name: 'loginExisting',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get actionRegister {
    return Intl.message(
      'Register',
      name: 'actionRegister',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get actionLogin {
    return Intl.message(
      'Log In',
      name: 'actionLogin',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get registerTitle {
    return Intl.message(
      'Register',
      name: 'registerTitle',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get usernameLabel {
    return Intl.message(
      'Username',
      name: 'usernameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter your username`
  String get usernameHint {
    return Intl.message(
      'Enter your username',
      name: 'usernameHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordLabel {
    return Intl.message(
      'Password',
      name: 'passwordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get passwordHint {
    return Intl.message(
      'Enter your password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get registerButton {
    return Intl.message(
      'Register',
      name: 'registerButton',
      desc: '',
      args: [],
    );
  }

  /// `Username must be at least 4 characters`
  String get usernameError {
    return Intl.message(
      'Username must be at least 4 characters',
      name: 'usernameError',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 7 characters`
  String get passwordError {
    return Intl.message(
      'Password must be at least 7 characters',
      name: 'passwordError',
      desc: '',
      args: [],
    );
  }

  /// `Skip Registration`
  String get skipRegistration {
    return Intl.message(
      'Skip Registration',
      name: 'skipRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Warning: You will not be able to access your account on other devices.`
  String get skipRegistrationWarning {
    return Intl.message(
      'Warning: You will not be able to access your account on other devices.',
      name: 'skipRegistrationWarning',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueButton {
    return Intl.message(
      'Continue',
      name: 'continueButton',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancelButton {
    return Intl.message(
      'Cancel',
      name: 'cancelButton',
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
