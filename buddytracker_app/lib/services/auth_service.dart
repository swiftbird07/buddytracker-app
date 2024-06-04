// lib/services/auth_service.dart
import 'dart:io';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_udid/flutter_udid.dart';

class AuthService {
  static const String _baseUrl = 'https://yourapi.com/api/v1/auth';

  Future<String?> loginUserBasicAuth(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/loginUser'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
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
      Uri.parse('$_baseUrl/registerUser'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
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
      Uri.parse('$_baseUrl/registerUser'),
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
  final _storage = FlutterSecureStorage();

  Future<void> saveToken(String token) async {
  await _storage.write(key: 'auth_token', value: token);
  }

  Future<String?> getToken() async {
  return await _storage.read(key: 'auth_token');
  }
}