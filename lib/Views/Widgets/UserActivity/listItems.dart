import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class listItemUserActivity extends StatelessWidget {
  final Color clr;
  final String value;
  listItemUserActivity({required this.clr, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 200,
      decoration: BoxDecoration(),
      child: Card(
        color: clr,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
