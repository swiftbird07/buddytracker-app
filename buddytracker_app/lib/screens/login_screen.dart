import 'package:buddytracker_app/screens/change_server_screen.dart';
import 'package:flutter/material.dart';
import 'register_screen.dart';
import '../generated/l10n.dart';
import '../services/database_helper.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? currentServer;
  final dbHelper = DatabaseHelper.instance;

  @override
  void initState() {
    super.initState();
    _loadServerName();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final s = S.of(context);
    });
  }

  void _loadServerName() async {
    // First check if DB exists
    await dbHelper.database;

    String? serverName = await dbHelper.getServerName();
    if (serverName == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          currentServer = S.of(context).officialServer;
        });
      });
    } else {
      setState(() {
        currentServer = serverName;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(s.welcomeTitle),
        //backgroundColor: Colors.deepOrangeAccent,
      ),
      backgroundColor: Colors.grey[200], 
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 20),
                  Text(
                    s.welcomeSubtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    s.noAccountFound,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    s.chooseOption,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.person_add),
                    label: Text(s.registerUsernamePassword),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen())),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.skip_next),
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
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.login),
                    label: Text(s.loginExisting),
                    onPressed: () {
                      // Implement login function
                    },
                  ),
                  // "Using Server X" Text
                  const SizedBox(height: 24),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]), // Default text style
                      children: <TextSpan>[
                        TextSpan(text: '${s.usingServerBegin} '), // First part of the sentence
                        TextSpan(
                          text: currentServer, // This is the part you want in bold
                          style: const TextStyle(fontWeight: FontWeight.bold), // Bold style
                        ),
                        TextSpan(text: ' ${s.usingServerEnd}'), // End part of the sentence
                      ],
                    ),
                  ),
                  InkWell(
                    child: Text(
                      s.changeServerLink,
                      style: const TextStyle(fontSize: 16, decoration: TextDecoration.underline),
                    ),
                    onTap: () async {
                      // Using Navigator.push and waiting for the result
                      final result = await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChangeServerScreen())
                      );

                      // Check if the result is true and refresh server name if needed
                      if (result == true) {
                        _loadServerName();  // Assuming this method loads the server name from the database
                      }
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