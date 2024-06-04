// main.dart
import 'package:flutter/material.dart';
import 'screens/main_screen.dart';

void main() => runApp(BuddyTrackerApp());

class BuddyTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buddy Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}