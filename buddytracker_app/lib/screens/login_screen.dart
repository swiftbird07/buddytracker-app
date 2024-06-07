import 'package:buddytracker_app/screens/change_server_screen.dart';
import 'package:flutter/material.dart';
import 'register_screen.dart';
import '../generated/l10n.dart';
import '../services/database_helper.dart';
import '../services/auth_service.dart';
import 'main_screen.dart';
import 'package:logger/logger.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TokenStorage _tokenStorage = TokenStorage();
  String? currentServer;
  final dbHelper = DatabaseHelper.instance;
  var logger = Logger(
    printer: PrettyPrinter(), // Use the pretty printer for better log readability
  );

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

  void _skipRegistration() async {
    Navigator.of(context).pop();  // Close the dialog first
    // Recreate _authService to ensure the latest server URL is used
    final AuthService authService = AuthService();

    String? token = await authService.registerUserAnonymous();
    if (token != null) {
      String? loginToken = await authService.loginUserAnonymous();
      if (loginToken != null) {
        // If registration and login are successful, save the token and navigate to the main screen
        await _tokenStorage.saveToken(token);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      } else {
        _showError("Failed to log in.");
      }
    } else {
      _showError("Failed to register.");
    }
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Error"),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text("OK"),
            onPressed: () => Navigator.of(ctx).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(s.welcomeTitle),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 20), // Welcome
                  Text(
                    s.welcomeSubtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    s.noAccountFound, // "No account found"
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    s.chooseOption, // "Choose an option below"
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon( // Login with existing account
                    icon: const Icon(Icons.login),
                    label: Text(s.loginExisting),
                    onPressed: () {
                      // Implement login function
                    },
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon( // Register with username and password
                    icon: const Icon(Icons.person_add),
                    label: Text(s.registerUsernamePassword),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen())),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon( // Skip registration
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
                              onPressed: _skipRegistration,
                              child: Text(s.continueButton)
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
                  // "Using Server X" Text
                  const SizedBox(height: 24),
                  RichText( // Change server URL
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
                          MaterialPageRoute(builder: (context) => const ChangeServerScreen())
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