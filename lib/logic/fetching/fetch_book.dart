import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/entities/book.dart';

Future<List<Book>> fetchBooks() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/books'));

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final booksResponse = BooksResponse.fromJson(jsonData);
    return booksResponse.books;
  } else {
    throw Exception('Failed to load books');
  }
}
