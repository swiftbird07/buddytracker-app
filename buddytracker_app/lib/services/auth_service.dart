// lib/services/auth_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_udid/flutter_udid.dart';
import '../services/database_helper.dart';  // Database operations
import '../generated/l10n.dart';  // Localization


class AuthService {
    final DatabaseHelper dbHelper = DatabaseHelper.instance;
    late final String _baseUrl;
    late final String _userAgent;

    AuthService() {
      _initializeAsync();
    }

    void _initializeAsync() async {
      _baseUrl = (await getURL())!;
      _userAgent = 'BuddyTracker/' + getBuildVersion();
    }

    Future<String?> getURL() async {
      return await dbHelper.getServerName();
    }

    String getBuildVersion() {
      return "0.1.0"; // TODO: Get this from the build configuration
    }

    Future<String?> loginUserBasicAuth(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth'), // "POST" to auth = login
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'UDID': await getDeviceIdentifier(),
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)['token'];
    } else {
      return null;
    }
  }

  Future<String?> loginUserAnonymous() async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth'), // "POST" to auth = login
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'UDID': await getDeviceIdentifier(),
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)['token'];
    } else {
      return null;
    }
  }

  Future<String?> registerUserBasicAuth(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/user'), // "POST" a user = register
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'UDID': await getDeviceIdentifier(),
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)['token'];
    } else {
      return null;
    }
  }

    Future<String?> registerUserAnonymous(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/user'), // "POST" a user = register
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'UDID': await getDeviceIdentifier(),
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)['token'];
    } else {
      return null;
    }
  }


  Future<String> getDeviceIdentifier() async {
    return await FlutterUdid.udid;
  }

}

class TokenStorage  {
  final _storage = const FlutterSecureStorage();

  Future<void> saveToken(String token) async {
  await _storage.write(key: 'auth_token', value: token);
  }

  Future<String?> getToken() async {
  return await _storage.read(key: 'auth_token');
  }
}