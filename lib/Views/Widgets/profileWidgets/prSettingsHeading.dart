import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class settingsHead extends StatelessWidget {
  final String headText;
  settingsHead({
    required this.headText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          headText,
          textAlign: TextAlign.right,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
