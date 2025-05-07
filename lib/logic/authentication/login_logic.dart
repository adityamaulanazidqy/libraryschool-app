import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<void> loginUser(String email, String password) async {
  var url = Uri.parse('http://10.0.2.2:8080/login');

  try {
    var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        })
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      debugPrint(data['message']);
      debugPrint(data['token']);
    } else {
      var data = jsonDecode(response.body);
      debugPrint(data['message']);
      debugPrint('Error: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to login: $e');
  }
}
