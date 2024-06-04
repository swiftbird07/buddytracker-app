// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "actionLogin": MessageLookupByLibrary.simpleMessage("Log In"),
        "actionRegister": MessageLookupByLibrary.simpleMessage("Register"),
        "cancelButton": MessageLookupByLibrary.simpleMessage("Cancel"),
        "chooseOption": MessageLookupByLibrary.simpleMessage(
            "Please choose one of the following options to continue:"),
        "continueButton": MessageLookupByLibrary.simpleMessage("Continue"),
        "loginExisting": MessageLookupByLibrary.simpleMessage(
            "Log In with Existing Account"),
        "noAccountFound": MessageLookupByLibrary.simpleMessage(
            "No existing account linked to this device."),
        "passwordError": MessageLookupByLibrary.simpleMessage(
            "Password must be at least 7 characters"),
        "passwordHint":
            MessageLookupByLibrary.simpleMessage("Enter your password"),
        "passwordLabel": MessageLookupByLibrary.simpleMessage("Password"),
        "registerAnonymously": MessageLookupByLibrary.simpleMessage(
            "Register Anonymously (Device only)"),
        "registerButton": MessageLookupByLibrary.simpleMessage("Register"),
        "registerTitle": MessageLookupByLibrary.simpleMessage("Register"),
        "registerUsernamePassword": MessageLookupByLibrary.simpleMessage(
            "Register with Username and Password"),
        "skipRegistration":
            MessageLookupByLibrary.simpleMessage("Skip Registration"),
        "skipRegistrationWarning": MessageLookupByLibrary.simpleMessage(
            "Warning: You will not be able to access your account on other devices."),
        "usernameError": MessageLookupByLibrary.simpleMessage(
            "Username must be at least 4 characters"),
        "usernameHint":
            MessageLookupByLibrary.simpleMessage("Enter your username"),
        "usernameLabel": MessageLookupByLibrary.simpleMessage("Username"),
        "welcomeSubtitle": MessageLookupByLibrary.simpleMessage(
            "Let\'s get started by setting up your account."),
        "welcomeTitle":
            MessageLookupByLibrary.simpleMessage("Welcome to Our App!")
      };
}
