import 'package:flutter/material.dart';
import '../generated/l10n.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return ListView(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.light_mode),
            title: Text(s.settingTheme),
          trailing: Switch(
            value: true,
            onChanged: (bool value) {
              // TODO
            },
          ),
        ),
        ListTile(
          leading: const Icon(Icons.notifications),
          title: Text(s.settingNotifications),
          trailing: Switch(
            value: false,
            onChanged: (bool value) {
              // TODO
            },
          ),
        ),
      ],
    );
  }
}