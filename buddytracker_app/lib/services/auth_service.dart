// lib/services/auth_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_udid/flutter_udid.dart';
import '../services/database_helper.dart';  // Database operations
import 'package:logger/logger.dart';
import '../generated/l10n.dart';  // Localization



class AuthService {
    final DatabaseHelper dbHelper = DatabaseHelper.instance;
    late final String _userAgent = 'BuddyTrackerApp/0.1.0';
    S s = S();
    var logger = Logger(
      printer: PrettyPrinter(), // Use the pretty printer for better log readability
    );

    Future<String> getDynamicURL() async {
      String? serverUrl = await dbHelper.getServerName();
      if (serverUrl == null) {
        throw Exception("Server URL not found");
      }

      // Translate the name of the official (dev) server to the actual URL
      if (serverUrl == s.officialServer) {
        return s.officialServerURL;
      } else if (serverUrl == s.officialServerDev) {
        return s.officialServerDevURL;
      }

      // If the server name is not the official server, return the server URL as is
      return '$serverUrl/api/v1';
    }


  Future<String?> loginUserBasicAuth(String email, String password) async {
    String baseUrl = await getDynamicURL();
    final response = await http.post(
      Uri.parse('$baseUrl/auth'), // "POST" to auth = login
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'User-Agent': _userAgent,
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
      logger.e('Failed to login user: ${response.body}');
      return null;
    }
  }

  Future<String?> loginUserAnonymous() async {
    String baseUrl = await getDynamicURL();
    final response = await http.post(
      Uri.parse('$baseUrl/auth'), // "POST" to auth = login
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'User-Agent': _userAgent,
      },
      body: jsonEncode(<String, String>{
        'UDID': await getDeviceIdentifier(),
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)['token'];
    } else {
      logger.e('Failed to login user: ${response.body}');
      return null;
    }
  }

  Future<String?> registerUserBasicAuth(String email, String password) async {
    String baseUrl = await getDynamicURL();
    final response = await http.post(
      Uri.parse('$baseUrl/user'), // "POST" a user = register
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'User-Agent': _userAgent,
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
      logger.e('Failed to register user: ${response.body}. Status code: ${response.statusCode}');
      return null;
    }
  }

    Future<String?> registerUserAnonymous() async {
      String baseUrl = await getDynamicURL();
      logger.d(baseUrl);
      try {
        final response = await http.post(
          Uri.parse('$baseUrl/user'), // "POST" a user = register
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'User-Agent': _userAgent,
          },
          body: jsonEncode(<String, String>{
            'UDID': await getDeviceIdentifier(),
          }),
        );

        if (response.statusCode == 200) {
          return json.decode(response.body)['token'];
        } else {
          logger.e('Failed to register user: ${response.body}. Status code: ${response.statusCode}');
          return null;
        }
      }
      catch (e) {
        logger.e('Failed to register user: $e');
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

  Future<void> deleteToken() async {
  await _storage.delete(key: 'auth_token');
  }
}