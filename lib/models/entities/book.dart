class Book {
  final int bookID;
  final String title;
  final String author;
  final String cover;
  final String isbn;
  final int publicationYear;
  final int genreID;
  final String genre;
  final int quantity;

  Book({
    required this.bookID,
    required this.title,
    required this.author,
    required this.cover,
    required this.isbn,
    required this.publicationYear,
    required this.genreID,
    required this.genre,
    required this.quantity,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      bookID: json['book_id'],
      title: json['title'],
      author: json['author'],
      cover: json['cover'],
      isbn: json['isbn'],
      publicationYear: json['publication_year'],
      genreID: json['genre_id'],
      genre: json['genre'],
      quantity: json['quantity'],
    );
  }
}

class BooksResponse {
  final String message;
  final List<Book> books;

  BooksResponse({required this.message, required this.books});

  factory BooksResponse.fromJson(Map<String, dynamic> json) {
    final List<Book> booksList = (json['data'] as List)
        .map((item) => Book.fromJson(item))
        .toList();

    return BooksResponse(
      message: json['message'],
      books: booksList,
    );
  }
}
