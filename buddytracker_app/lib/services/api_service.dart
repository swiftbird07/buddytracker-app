// lib/services/auth_service.dart
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_udid/flutter_udid.dart';
import '../generated/l10n.dart';  // Localization


class ApiService {
  // Function to test server connection
  Future<bool> testServerConnection(String serverUrl) async {
    try {
      final response = await http.get(
          Uri.parse('$serverUrl/api/v1/serverinfo'));
      return response.statusCode == 200;
    } catch (e) {
      return false; // Return false on exception/error
    }
  }
}