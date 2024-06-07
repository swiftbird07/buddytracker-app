import 'package:http/http.dart' as http;
import 'dart:convert';
import 'auth_service.dart';
import 'database_helper.dart';
import 'package:logger/logger.dart';


class ApiService {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;
  late final String _userAgent = 'BuddyTrackerApp/0.1.0';
  AuthService authService = AuthService();
var logger = Logger(
    printer: PrettyPrinter(), // Use the pretty printer for better log readability
  );

  // Function to test server connection
  Future<bool> testServerConnection(String serverUrl) async {
    try {
      final response = await http.get(
          Uri.parse('$serverUrl/api/v1/serverinfo'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'User-Agent': _userAgent,
          });
      return response.statusCode == 200;
    } catch (e) {
      return false; // Return false on exception/error
    }
  }

  Future<List<Map<String, dynamic>>> getBuddiesWithStatus() async {
    final serverUrl = await authService.getDynamicURL();
    List<Map<String, dynamic>> buddies = [];
    logger.d('Fetching buddies from $serverUrl');

    try {
      // First API call to get list of buddies
      final buddyResponse = await http.get(
          Uri.parse('$serverUrl/buddies'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'User-Agent': _userAgent,
          }
      );

      if (buddyResponse.statusCode == 200) {
        List<dynamic> buddyList = json.decode(buddyResponse.body);
        // Second API call to get status for each buddy
        for (var userId in buddyList) {
          final statusResponse = await http.get(
              Uri.parse('$serverUrl/user/$userId/status'),
              headers: {
                'Content-Type': 'application/json; charset=UTF-8',
                'User-Agent': _userAgent,
              }
          );

          if (statusResponse.statusCode == 200) {
            Map<String, dynamic> status = json.decode(statusResponse.body);
            buddies.add({
              'user_id': userId,
              'name': status['name'],
              'avatar': status['avatar'],
              'status': status['status'],
              'activities': status['activities'],
              "location": status['location'],
              "location_accuracy": status['location_accuracy'],
              "last_updated": status['last_updated'],
              "expires_at": status['expires_at'], // unix timestamp when the status expires
            });
          } else {
            // Handle the error case where status couldn't be retrieved
            logger.w('Failed to load status for user ID: $userId Status code: ${statusResponse.statusCode}. Response: ${statusResponse.body}');
          }
        }
        return buddies;
      } else {
        throw Exception('Failed to load buddies. Status code: ${buddyResponse.statusCode}. Response: ${buddyResponse.body}');
      }
    } catch (e) {
      throw('Error fetching buddies from API: $e');
    }
  }
}