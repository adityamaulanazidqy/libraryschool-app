import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../core/constants/const_url_api.dart';

class AuthService {
  static Future<void> registerUser({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        AuthEndpoints.register,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        debugPrint('Register Success: ${data['message']}');
      } else {
        final error = jsonDecode(response.body);
        debugPrint(
          'Register Error ${response.statusCode}: ${error['message'] ?? 'Unknown error'}',
        );
      }
    } catch (e) {
      debugPrint('Exception during register: $e');
      rethrow;
    }
  }

  static Future<bool> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        AuthEndpoints.login,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        debugPrint('Login Success: ${data['token']}');
        return true;
      } else {
        final error = jsonDecode(response.body);
        debugPrint(
          'Login Error ${response.statusCode}: ${error['message'] ?? 'Unknown error'}',
        );
        return false;
      }
    } on TimeoutException catch (e) {
      debugPrint('Login request timed out: $e');
      return false;
    } catch (e) {
      debugPrint('Exception during login: $e');
      return false;
    }
  }
}
