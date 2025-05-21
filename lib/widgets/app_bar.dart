import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildAppBar extends StatelessWidget {
  final String titlePage;

  const BuildAppBar({super.key, required this.titlePage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Icon(
                FontAwesomeIcons.angleLeft,
                size: 24,
                color: Color(0xFF4A5433),
              ),
            ),
          ),
          Text(
            titlePage,
            style: GoogleFonts.poppins(
              color: const Color(0xFF4A5433),
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          IconButton(
            onPressed: () {},
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
}
