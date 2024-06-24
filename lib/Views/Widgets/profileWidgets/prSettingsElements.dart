import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class settingsElement extends StatelessWidget {
  final String elementText;
  final Widget? secondaryWidget;
  final IconData elementIcon;
  settingsElement({
    required this.elementText,
    required this.elementIcon,
    this.secondaryWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              elementText,
            ),
            secondaryWidget ??
                Icon(
                  elementIcon,
                ),
          ],
        ),
      ),
    );
  }
}
