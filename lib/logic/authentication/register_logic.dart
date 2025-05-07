import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<void> registerUser(String username, String email, String password) async {
  var url = Uri.parse('http://10.0.2.2:8080/register');

  try {
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      var data = jsonDecode(response.body);
      debugPrint(data['message']);
    } else {
      debugPrint('Error: ${response.statusCode}');
    }
  }catch (e) {
    throw Exception('Failed to register: $e');
  }
}