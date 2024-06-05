// main.dart
import 'package:buddytracker_app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'services/auth_service.dart';

void main() => runApp(BuddyTrackerApp());

class BuddyTrackerApp extends StatelessWidget {
  final TokenStorage _tokenStorage = TokenStorage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buddy Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: FutureBuilder<String?>(
        // Load the token from the secure storage
        future: _tokenStorage.getToken(),
        builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Or some other loading indicator
          } else {
            if (snapshot.hasData && snapshot.data != null) {
              return MainScreen(); // User is already logged in
            } else {
              return LoginScreen(); // No token found, user needs to login or register
            }
          }
        },
      ),
    );
  }
}