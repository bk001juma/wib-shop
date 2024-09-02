import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wibSHOP/components/screens/login.dart';
import 'package:wibSHOP/main.dart';
import 'package:wibSHOP/services/services.dart'; // Replace with actual home screen

class AuthNotifier extends StateNotifier<bool> {
  final AuthServices _authServices;

  AuthNotifier(this._authServices) : super(false);

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true; // Loading state

    try {
      final success = await _authServices.login(
        email: email,
        password: password,
      );

      if (success) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Invalid credentials, please try again')),
        );
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      state = false; // End of loading state
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
    // ignore: non_constant_identifier_names
    required String password_confirmation,
    required BuildContext context,
  }) async {
    state = true; // Loading state

    try {
      final success = await _authServices.register(
        name: name,
        email: email,
        password: password,
        password_confirmation: password_confirmation,
      );

      if (success) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) =>
                  const LoginScreen()), // Navigate to login page
        );
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Registration failed, please try again')),
        );
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      state = false; // End of loading state
    }
  }
}
