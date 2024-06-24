import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDashBoardGradient extends StatelessWidget {
  final String imageIcon;
  final String imageText;
  final List<Color> clr;

  MyDashBoardGradient(
      {required this.imageIcon, required this.imageText, required this.clr});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green,
              Colors.blueAccent,
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                imageIcon,
                filterQuality: FilterQuality.high,
              ),
              Text(
                imageText,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
