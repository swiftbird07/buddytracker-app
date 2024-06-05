import 'package:flutter/material.dart';
import '../generated/l10n.dart';  // Localization
import '../services/database_helper.dart';  // Database operations
import '../services/api_service.dart';  // API operations

class ChangeServerScreen extends StatefulWidget {
  @override
  _ChangeServerScreenState createState() => _ChangeServerScreenState();
}

class _ChangeServerScreenState extends State<ChangeServerScreen> {
  String? _selectedServer;
  final TextEditingController _customServerController = TextEditingController();
  final dbHelper = DatabaseHelper.instance;
  final ApiService apiService = ApiService();  // Instance of ApiService


  @override
  void initState() {
    super.initState();
    _loadCurrentServer();
  }

  void _loadCurrentServer() async {
    String? server = await dbHelper.getServerName();
    S s = S.of(context);
    setState(() {
      _selectedServer = server;
      // If the server is a custom server, load it into the text field
      if (_selectedServer != s.officialServer && _selectedServer != s.officialServerDev && _selectedServer != null) {
        _customServerController.text = _selectedServer!;
        _selectedServer = 'custom';  // Ensure 'custom' is selected in this case
      }
    });
  }

  void _updateServerUrlField(String? server) {
    S s = S.of(context);

    if (server == s.officialServer) {
      _customServerController.text = S.of(context).officialServerURL;
    } else if (server == s.officialServerDev) {
      _customServerController.text = S.of(context).officialServerDevURL;
    } else {
      _customServerController.text = server ?? '';
    }
  }

  void _saveServer() async {
    S s = S.of(context);
    // Skip connection check if using official server
    if (_selectedServer == s.officialServer || _selectedServer == s.officialServerDev) {
      await dbHelper.setServerName(_selectedServer!);
      Navigator.pop(context, true);  // Indicate success and go back
      return;
    }

    // Custom server, test the connection
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        S s = S.of(context);
        return Dialog(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 20),
                Text(s.testingConnection),
              ],
            ),
          ),
        );
      },
    );

    // Determine the server URL
    String? serverUrl = _selectedServer == 'custom' ? _customServerController.text : _selectedServer;
    bool testResult = await apiService.testServerConnection(serverUrl!);

    // Dismiss the dialog
    Navigator.pop(context);

    if (testResult) {
      // If the connection is successful, save the server setting
      await dbHelper.setServerName(serverUrl);
      Navigator.pop(context, true);  // Indicate success and go back
    } else {
      // If the connection test fails, alert the user
      showDialog(
        context: context,
        builder: (BuildContext context) {
          S s = S.of(context);
          return AlertDialog(
            title: Text(s.connectionFailedTitle),
            content: Text(s.connectionFailed),
            actions: <Widget>[
            TextButton(
                child: Text(s.continueButton),
                onPressed: () {
                  Navigator.of(context).pop();  // Close the dialog
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(s.changeServerTitle),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text(s.officialServer),
            leading: Radio<String>(
              value: s.officialServer,
              groupValue: _selectedServer,
              onChanged: (value) {
                setState(() {
                  _selectedServer = value;
                  _updateServerUrlField(value);
                });
              },
            ),
          ),
          ListTile(
            title: Text(s.officialServerDev),
            leading: Radio<String>(
              value: s.officialServerDev,
              groupValue: _selectedServer,
              onChanged: (value) {
                setState(() {
                  _selectedServer = value;
                  _updateServerUrlField(value);
                });
              },
            ),
          ),
          ListTile(
            title: Text(s.customServer),
            leading: Radio<String>(
              value: 'custom',
              groupValue: _selectedServer,
              onChanged: (value) {
                setState(() {
                  _selectedServer = value;
                  _customServerController.text = ''; // Clear when custom is selected
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _customServerController,
              decoration: InputDecoration(
                labelText: s.customServerLabel,
                hintText: 'https://',
              ),
              enabled: _selectedServer == 'custom',  // Only enable editing for custom server
            ),
          ),
          ElevatedButton(
            onPressed: _saveServer,
            child: Text(s.saveButton),
          ),
        ],
      ),
    );
  }
}