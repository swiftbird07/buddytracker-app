import 'package:flutter/material.dart';
import 'register_screen.dart';
import '../generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(s.welcomeTitle),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Functionality to change backend server
            },
          ),
        ],
      ),
      backgroundColor: Colors.grey[200], // Modern looking background color
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20),
                  Text(
                    s.welcomeSubtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    s.noAccountFound,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    s.chooseOption,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton.icon(
                    icon: Icon(Icons.person_add),
                    label: Text(s.registerUsernamePassword),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen())),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton.icon(
                    icon: Icon(Icons.skip_next),
                    label: Text(s.skipRegistration),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text(s.skipRegistration),
                          content: Text(s.skipRegistrationWarning),
                          actions: <Widget>[
                            TextButton(
                              child: Text(s.continueButton),
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                            ),
                            TextButton(
                              child: Text(s.cancelButton),
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 24),
                  ElevatedButton.icon(
                    icon: Icon(Icons.login),
                    label: Text(s.loginExisting),
                    onPressed: () {
                      // Implement login function
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}