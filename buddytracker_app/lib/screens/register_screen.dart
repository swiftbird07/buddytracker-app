import 'package:flutter/material.dart';
import '../generated/l10n.dart'; // Adjust the path based on your project structure

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus(); // to close the keyboard

    if (isValid) {
      _formKey.currentState!.save();
      print('Username: $_username, Password: $_password');
      // Implement your registration logic here
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context); // This fetches your localized strings

    return Scaffold(
      appBar: AppBar(
        title: Text(s.registerTitle),
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(20),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    key: ValueKey('username'),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 4) {
                        return s.usernameError;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: s.usernameLabel,
                      hintText: s.usernameHint,
                    ),
                    onSaved: (value) {
                      _username = value!;
                    },
                  ),
                  TextFormField(
                    key: ValueKey('password'),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 7) {
                        return s.passwordError;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: s.passwordLabel,
                      hintText: s.passwordHint,
                    ),
                    obscureText: true,
                    onSaved: (value) {
                      _password = value!;
                    },
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    child: Text(s.registerButton),
                    onPressed: _trySubmit,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}