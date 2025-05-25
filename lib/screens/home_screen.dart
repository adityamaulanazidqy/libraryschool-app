import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:libraryschool_aplication/screens/book_screens/book_borrowing_screen.dart';
import 'package:libraryschool_aplication/screens/book_screens/book_screen.dart';
import 'package:libraryschool_aplication/screens/book_screens/setting_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF5F7FA), Color(0xFFE4E8F0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(context),
              _buildWelcomeSection(),
              _buildMenuGrid(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                'https://i.pinimg.com/474x/6c/70/8a/6c708a78bfe268ed1e9af5720f952cd2.jpg',
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) =>
                        const Icon(Icons.person, color: Color(0xFF4A5433)),
              ),
            ),
          ),
          // Page title
          Text(
            "Home",
            style: GoogleFonts.poppins(
              color: const Color(0xFF4A5433),
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),

          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingPage()),
              );
            },
            icon: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Icon(
                Icons.settings_outlined,
                size: 24,
                color: Color(0xFF4A5433),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        children: [
          Text(
            'Welcome back!',
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF4A5433),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Explore the features of your digital library',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildMenuGrid(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            _buildMenuCard(
              icon: FontAwesomeIcons.bookOpen,
              title: 'Catalog',
              color: const Color(0xFF4A5433),
              onTap: () {},
            ),
            _buildMenuCard(
              icon: FontAwesomeIcons.bookBookmark,
              title: 'My Books',
              color: const Color(0xFF7F8571),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookBorrowingPage()),
                );
              },
            ),
            _buildMenuCard(
              icon: FontAwesomeIcons.clockRotateLeft,
              title: 'History',
              color: const Color(0xFF4A5433),
              onTap: () {},
            ),
            _buildMenuCard(
              icon: Icons.settings_outlined,
              title: 'Settings',
              color: const Color(0xFF7F8571),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 28, color: color),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF4A5433),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.10,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(FontAwesomeIcons.book, "Books", context),
          _buildNavItem(Icons.home, "Home", context, isActive: true),
          _buildNavItem(Icons.person, "Profile", context),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    BuildContext context, {
    bool isActive = false,
  }) {
    return GestureDetector(
      onTap: () {
        if (label == "Profile") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SettingPage()),
          );
        } else if (label == "Books") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookListPage()),
          );
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 28,
            color: isActive ? const Color(0xFF4A5433) : Colors.grey.shade600,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isActive ? const Color(0xFF4A5433) : Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
