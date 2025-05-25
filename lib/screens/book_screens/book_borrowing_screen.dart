import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:libraryschool_aplication/widgets/app_bar.dart';


class BookBorrowingPage extends StatefulWidget {
  const BookBorrowingPage({super.key});

  @override
  State<BookBorrowingPage> createState() => _BookBorrowingPageState();
}

class _BookBorrowingPageState extends State<BookBorrowingPage> {
  final List<Map<String, dynamic>> currentlyReading = [
    {
      'title': 'Sapiens',
      'author': 'Yuval Noah Harari',
      'description':
          'Sapiens: A Brief History of Humankind" by Yuval Noah Harari is a comprehensive overview of human history, from the Stone Age to the present day.',
      'category': 'History',
      'cover':
          'https://m.media-amazon.com/images/I/713jIoMO3UL._AC_UF1000,1000_QL80_.jpg',
      'progress': 0.65,
      'dueDate': 'May 30, 2023',
      'isOnline': true,
    },
  ];

  final List<Map<String, dynamic>> borrowedBooks = [
    {
      'title': 'Atomic Habits',
      'author': 'James Clear',
      'description':
          'An easy & proven way to build good habits & break bad ones.',
      'category': 'Self Improvement',
      'cover': 'https://m.media-amazon.com/images/I/51B7kuFwQFL._SY425_.jpg',
      'dueDate': 'June 15, 2023',
      'isOnline': false,
    },
    {
      'title': 'The Psychology of Money',
      'author': 'Morgan Housel',
      'description': 'Timeless lessons on wealth, greed, and happiness.',
      'category': 'Finance',
      'cover': 'https://readmoredxb.com/cdn/shop/files/ThePsychologyOfMoneyreadmoredxb.com.png?v=1705229833',
      'dueDate': 'June 20, 2023',
      'isOnline': false,
    },
  ];

  int _countUniqueCategories(){
    List<String> allCategories = [];
    allCategories.addAll(borrowedBooks.map((book) => book['category'] as String));
    return allCategories.toSet().length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            BuildAppBar(titlePage: "Book Borrowing"),
            SizedBox(height: 16),
            _buildStatsSection(),
            SizedBox(height: 24),
            _buildBookListsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          Expanded(
            child: _buildStatCard(
              icon: Icons.menu_book_rounded,
              value: borrowedBooks.length.toString(),
              label: "Books",
              color: Color(0xFF4A5433),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: _buildStatCard(
              icon: Icons.category_rounded,
              value: "${_countUniqueCategories()}",
              label: "Genres",
              color: Color(0xFF4A5433),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: _buildStatCard(
              icon: Icons.bookmark_added_rounded,
              value: "${currentlyReading.length + borrowedBooks.length}",
              label: "Borrowed",
              color: Color(0xFF4A5433),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookListsSection() {
    return Expanded(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Currently Reading Section
            if (currentlyReading.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Currently Reading",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: 16),
              ...currentlyReading.map(
                (book) => _buildCurrentlyReadingCard(
                  title: book['title'],
                  author: book['author'],
                  description: book['description'],
                  cover: book['cover'],
                  category: book['category'],
                  progress: book['progress'],
                  dueDate: book['dueDate'],
                ),
              ),
              SizedBox(height: 24),
            ],

            // Borrowed Books Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Borrowed Books (Offline)",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 16),
            ...borrowedBooks.map(
              (book) => _buildBorrowedBookCard(
                title: book['title'],
                author: book['author'],
                description: book['description'],
                cover: book['cover'],
                category: book['category'],
                dueDate: book['dueDate'],
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentlyReadingCard({
    required String title,
    required String author,
    required String category,
    required String cover,
    required String description,
    required double progress,
    required String dueDate,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 16,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      cover,
                      height: 140,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          author,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF4A5433).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            category,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF4A5433),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Due: $dueDate",
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey.shade200,
                    color: Color(0xFF4A5433),
                    minHeight: 6,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${(progress * 100).toInt()}% completed",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Text(
                        "${((1 - progress) * 100).toInt()}% left",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        side: BorderSide(color: Color(0xFF4A5433)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Extend Loan",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF4A5433),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        backgroundColor: Color(0xFF4A5433),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Read Now",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildBorrowedBookCard({
    required String title,
    required String author,
    required String category,
    required String cover,
    required String description,
    required String dueDate,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 16,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      cover,
                      height: 140,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                title,
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                "OFFLINE",
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          author,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFF4A5433).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            category,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF4A5433),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Due: $dueDate",
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        backgroundColor: Color(0xFF4A5433),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Return Book",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        side: BorderSide(color: Color(0xFF4A5433)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Extend Loan",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF4A5433),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
