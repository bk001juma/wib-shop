import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthServices {
  final String _loginUrl = 'http://192.168.0.38:8080/api/users/login';
  final String _registerUrl = 'http://192.168.0.38:8080/api/users/register';

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
        // Handle JSON response if needed
        // You can parse the response body if your API returns any additional data
        return true;
      } else {
        // Detailed error handling
        print('Login failed: ${response.statusCode} - ${response.body}');
        return false;
      }
    } catch (e) {
      // Log exception details for debugging
      print('Exception during login: $e');
      return false;
    }
  }

  Future<bool> register({
    required String username,
    required String email,
    required String password,
    required String confirmpassword,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(_registerUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'email': email,
          'password': password,
          'confirmpassword': confirmpassword,
        }),
      );

      switch (response.statusCode) {
        case 200:
          // Assuming success message is returned as plain text
          final responseBody = response.body;
          return responseBody.contains('User registered successfully');

        case 400:
          // Handle client-side error
          print(
              'Registration failed: ${response.statusCode} - Bad Request - ${response.body}');
          return false;

        case 401:
          // Handle unauthorized error
          print(
              'Registration failed: ${response.statusCode} - Unauthorized - ${response.body}');
          return false;

        default:
          // Handle other status codes or unexpected responses
          print(
              'Registration failed: ${response.statusCode} - ${response.body}');
          return false;
      }
    } catch (e) {
      // Log exception details for debugging
      print('Exception during registration: $e');
      return false;
    }
  }
}
