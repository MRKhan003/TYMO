import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class authHeading extends StatelessWidget {
  final String mainText;
  final String subText;
  final String assetsImagePath;
  final double textSize;
  final double imageSize;
  authHeading(
      {required this.mainText,
      required this.subText,
      required this.assetsImagePath,
      required this.textSize,
      required this.imageSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            Text(
              mainText,
              style: GoogleFonts.poppins(
                fontSize: textSize,
                //fontStyle: FontStyle.italic
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: imageSize,
              child: Image.asset(
                assetsImagePath,
                filterQuality: FilterQuality.high,
              ),
            ),
          ],
        ),
        Text(
          subText,
          style: GoogleFonts.poppins(
            fontSize: textSize,
            //fontStyle: FontStyle.italic
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
