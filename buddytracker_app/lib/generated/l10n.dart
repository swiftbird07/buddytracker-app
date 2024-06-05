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

  /// `Welcome to Buddy Tracker!`
  String get welcomeTitle {
    return Intl.message(
      'Welcome to Buddy Tracker!',
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

  /// `Register New Account`
  String get registerUsernamePassword {
    return Intl.message(
      'Register New Account',
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

  /// `Using`
  String get usingServerBegin {
    return Intl.message(
      'Using',
      name: 'usingServerBegin',
      desc: '',
      args: [],
    );
  }

  /// `Official Server`
  String get officialServer {
    return Intl.message(
      'Official Server',
      name: 'officialServer',
      desc: '',
      args: [],
    );
  }

  /// `https://buddytracker.app`
  String get officialServerURL {
    return Intl.message(
      'https://buddytracker.app',
      name: 'officialServerURL',
      desc: '',
      args: [],
    );
  }

  /// `Official Server (Development Branch)`
  String get officialServerDev {
    return Intl.message(
      'Official Server (Development Branch)',
      name: 'officialServerDev',
      desc: '',
      args: [],
    );
  }

  /// `https://dev.buddytracker.app`
  String get officialServerDevURL {
    return Intl.message(
      'https://dev.buddytracker.app',
      name: 'officialServerDevURL',
      desc: '',
      args: [],
    );
  }

  /// `Custom Server`
  String get customServer {
    return Intl.message(
      'Custom Server',
      name: 'customServer',
      desc: '',
      args: [],
    );
  }

  /// `Server URL`
  String get customServerLabel {
    return Intl.message(
      'Server URL',
      name: 'customServerLabel',
      desc: '',
      args: [],
    );
  }

  /// `https://yourcustomserver.com`
  String get customServerHint {
    return Intl.message(
      'https://yourcustomserver.com',
      name: 'customServerHint',
      desc: '',
      args: [],
    );
  }

  /// `as backend.`
  String get usingServerEnd {
    return Intl.message(
      'as backend.',
      name: 'usingServerEnd',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get changeServerLink {
    return Intl.message(
      'Change',
      name: 'changeServerLink',
      desc: '',
      args: [],
    );
  }

  /// `Change Server`
  String get changeServerTitle {
    return Intl.message(
      'Change Server',
      name: 'changeServerTitle',
      desc: '',
      args: [],
    );
  }

  /// `Testing connection to server...`
  String get testingConnection {
    return Intl.message(
      'Testing connection to server...',
      name: 'testingConnection',
      desc: '',
      args: [],
    );
  }

  /// `Connection failed.`
  String get connectionFailedTitle {
    return Intl.message(
      'Connection failed.',
      name: 'connectionFailedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Connection failed. Please check the server URL and try again.`
  String get connectionFailed {
    return Intl.message(
      'Connection failed. Please check the server URL and try again.',
      name: 'connectionFailed',
      desc: '',
      args: [],
    );
  }

  /// `Connection successful!`
  String get connectionSuccess {
    return Intl.message(
      'Connection successful!',
      name: 'connectionSuccess',
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

  /// `Save`
  String get saveButton {
    return Intl.message(
      'Save',
      name: 'saveButton',
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

  /// `Notifications`
  String get settingNotifications {
    return Intl.message(
      'Notifications',
      name: 'settingNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get settingTheme {
    return Intl.message(
      'Dark Mode',
      name: 'settingTheme',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?`
  String get areYouSure {
    return Intl.message(
      'Are you sure?',
      name: 'areYouSure',
      desc: '',
      args: [],
    );
  }

  /// `Do you really want to logout?`
  String get logoutConfirmation {
    return Intl.message(
      'Do you really want to logout?',
      name: 'logoutConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
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
