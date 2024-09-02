import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthServices {
  final String _loginUrl = 'http://192.168.43.135:8000/api/login';
  final String _registerUrl = 'http://192.168.0.48:8000/api/register';

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(_loginUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // Assuming a successful response indicates a successful login
        // Handle JSON response if needed
        return true;
      } else {
        // Log error or handle different status codes
        return false;
      }
    } catch (e) {
      // Handle exceptions
      return false;
    }
  }

  Future<bool> register({
    required String name,
    required String email,
    required String password,
    // ignore: non_constant_identifier_names
    required String password_confirmation,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(_registerUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': password_confirmation,
        }),
      );

      if (response.statusCode == 200) {
        // Check if the response body contains the expected success message
        final responseBody = jsonDecode(response.body);
        return responseBody['status'] == 'success';
      } else if (response.statusCode == 302) {
        // Handle redirection here if needed
        print('Redirected: ${response.headers['location']}');
        return false;
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
        return false;
      }
    } catch (e) {
      print('Exception: $e');
      return false;
    }
  }
}
