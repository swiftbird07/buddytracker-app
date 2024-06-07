import 'package:buddytracker_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import '../services/database_helper.dart';
import '../services/auth_service.dart';
import '../generated/l10n.dart';

class SettingsScreen extends StatelessWidget {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;
  final TokenStorage tokenStorage = TokenStorage();

  SettingsScreen({super.key});

  void showLogoutConfirmation(BuildContext context) {
    final s = S.of(context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(s.areYouSure),
          content: Text(s.logoutConfirmation),
          actions: <Widget>[
            TextButton(
              child: Text(s.yes),
              onPressed: () {
                Navigator.of(context).pop();  // Close the dialog
                performLogout(context);  // Proceed with the logout
              },
            ),
            TextButton(
              child: Text(s.no),
              onPressed: () {
                Navigator.of(context).pop();  // Close the dialog without doing anything
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> performLogout(BuildContext context) async {
    // TODO: DELETE to logout endpoint to invalidate the token
    await dbHelper.deleteAll();
    await tokenStorage.deleteToken();
    // Go to "LoginScreen"
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );  }

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
              // TODO: Implement theme switching logic
            },
          ),
        ),
        ListTile(
          leading: const Icon(Icons.notifications),
          title: Text(s.settingNotifications),
          trailing: Switch(
            value: false,
            onChanged: (bool value) {
              // TODO: Implement notifications switching logic
            },
          ),
        ),
        ListTile(
          leading: const Icon(Icons.exit_to_app, color: Colors.red),
          title: Text(s.logout, style: const TextStyle(color: Colors.red)),
          onTap: () => showLogoutConfirmation(context),
        ),
      ],
    );
  }
}