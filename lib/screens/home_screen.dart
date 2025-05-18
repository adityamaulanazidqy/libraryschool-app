import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:libraryschool_aplication/screens/book_screens/setting_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF7F8571), Color(0xFF4A5433)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xFFD9D9D9),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xFFCBD6BE),
                        width: 4,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        'https://i.pinimg.com/474x/6c/70/8a/6c708a78bfe268ed1e9af5720f952cd2.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      "Home Page",
                      style: GoogleFonts.poppins(
                        color: Color(0xFF4A5433),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.settings),
                    iconSize: 36,
                    color: Color(0xFF4A5433),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Welcome back!',
                      style: GoogleFonts.poppins(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD9D9D9),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Explore the features of your digital library.',
                      style: GoogleFonts.poppins(fontSize: 14, color: Color(0xFFD9D9D9)),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),

              // Card Grid Menu
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    _buildMenuCard(
                        icon: Icons.book,
                        title: 'Catalog',
                        color: Colors.blue,
                        onTap: () {}),
                    _buildMenuCard(
                        icon: Icons.bookmark,
                        title: 'My Books',
                        color: Colors.green,
                        onTap: () {}),
                    _buildMenuCard(
                        icon: Icons.history,
                        title: 'History',
                        color: Colors.black26,
                        onTap: () {}),
                    _buildMenuCard(
                        icon: Icons.settings,
                        title: 'Settings',
                        color: Colors.purple,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage()));
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 76,
          decoration: BoxDecoration(
            color: Color(0xFFD9D9D9),
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildNavItem(Icons.book, "Book", context),
              _buildNavItem(Icons.home_filled, "Home",context),
              _buildNavItem(Icons.person, "Profile",context),
            ],
          ),
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
          color: Color(0xFFCBD6BE),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              blurStyle: BlurStyle.outer,
              offset: Offset(2, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, color: color, size: 30,),
            ),
            SizedBox(height: 12),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            if (label == "Profile") {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage()));
            }else if (label == "Home"){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            }
          },
          child: Column(
            children: <Widget>[
              Icon(icon, color: Color(0xFF7F8571), size: 36),
              SizedBox(height: 4),
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Color(0xFF4A5433),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

