import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.light_mode),
          title: const Text('Dunkles Thema'),
          trailing: Switch(
            value: true,
            onChanged: (bool value) {
              // Implementieren Sie Logik zum Umschalten
            },
          ),
        ),
        ListTile(
          leading: const Icon(Icons.notifications),
          title: const Text('Benachrichtigungen'),
          trailing: Switch(
            value: false,
            onChanged: (bool value) {
              // Implementieren Sie Logik zum Umschalten
            },
          ),
        ),
      ],
    );
  }
}