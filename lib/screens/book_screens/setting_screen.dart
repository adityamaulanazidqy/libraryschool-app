import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:libraryschool_aplication/screens/home_screen.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final List<Map<String, String>> favoriteBooks = [
    {
      'title': 'The Silent Patient',
      'author': 'Alex Michaelides',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRZKRYwK-lWX0_AKS3jH4b4HYblz0bIm3RUg&s'
    },
    {
      'title': 'Dune',
      'author': 'Frank Herbert',
      'image': 'https://m.media-amazon.com/images/I/81ym3QUd3KL._AC_UF1000,1000_QL80_.jpg'
    },
    {
      'title': 'Atomic Habits',
      'author': 'James Clear',
      'image': 'https://m.media-amazon.com/images/I/81bGKUa1e0L._AC_UF1000,1000_QL80_.jpg'
    },
  ];

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
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.angleLeft,
                      size: 36,
                      color: Color(0xFF4A5433),
                    ),
                    iconSize: 28,
                    color: Color(0xFF4A5433),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      "Setting Page",
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
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Profile Section
              Container(
                height: 200,
                width: 200,
                margin: EdgeInsets.only(top: 56),
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color(0xFFCBD6BE),
                    width: 4,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    )
                  ],
                ),
                child: ClipOval(
                  child: Image.network(
                    'https://i.pinimg.com/474x/6c/70/8a/6c708a78bfe268ed1e9af5720f952cd2.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 28),
                child: Column(
                  children: [
                    Text(
                      "Aditya Maulana Zidqy",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "adityamaullanazidqy@gmail.com",
                      style: GoogleFonts.poppins(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),

              // Stats Section
              Container(
                margin: EdgeInsets.only(top: 28),
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildStatContainer("12", "Books read"),
                      SizedBox(width: 12),
                      _buildStatContainer("5", "Sanctions"),
                    ],
                  ),
                ),
              ),

              // Favorite Books Section
              Container(
                margin: EdgeInsets.only(top: 40, bottom: 20),
                child: Column(
                  children: [
                    // Section Title with decorative elements
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            color: Color(0xFFD9D9D9).withOpacity(0.5),
                            thickness: 2,
                            indent: 40,
                            endIndent: 20,
                          ),
                        ),
                        Text(
                          "Favorite Books",
                          style: GoogleFonts.poppins(
                            color: Color(0xFFD9D9D9),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Color(0xFFD9D9D9).withOpacity(0.5),
                            thickness: 2,
                            indent: 20,
                            endIndent: 40,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Books List
                    SizedBox(
                      height: 280,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        scrollDirection: Axis.horizontal,
                        itemCount: favoriteBooks.length,
                        itemBuilder: (context, index) {
                          return _buildBookCard(favoriteBooks[index]);
                        },
                      ),
                    ),
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
              _buildNavItem(Icons.home_filled, "Home", context),
              _buildNavItem(Icons.person, "Profile", context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatContainer(String value, String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Color(0xFFCBD6BE).withOpacity(0.9),
        borderRadius: BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: Color(0xFF4A5433),
              fontWeight: FontWeight.bold,
            ),
          ),
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
    );
  }

  Widget _buildBookCard(Map<String, String> book) {
    return Container(
      width: 180,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Color(0xFFCBD6BE).withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Book Cover
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              image: DecorationImage(
                image: NetworkImage(book['image']!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Book Info
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book['title']!,
                  style: GoogleFonts.poppins(
                    color: Color(0xFF4A5433),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  'by ${book['author']!}',
                  style: GoogleFonts.poppins(
                    color: Color(0xFF4A5433).withOpacity(0.8),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, color: Color(0xFF4A5433), size: 16),
                    Icon(Icons.star, color: Color(0xFF4A5433), size: 16),
                    Icon(Icons.star, color: Color(0xFF4A5433), size: 16),
                    Icon(Icons.star, color: Color(0xFF4A5433), size: 16),
                    Icon(Icons.star_half, color: Color(0xFF4A5433), size: 16),
                  ],
                ),
              ],
            ),
          ),
        ],
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