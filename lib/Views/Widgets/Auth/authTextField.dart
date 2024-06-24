import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class authTextField extends StatelessWidget {
  final IconData TextFieldIcon;
  final String IconLabel;
  final double LabelSize;
  final bool HideText;
  final double IconSize;
  final TextInputType type;
  final TextEditingController controller;
  // final String TextFieldIcon;
  authTextField(
      {required this.TextFieldIcon,
      required this.IconLabel,
      required this.LabelSize,
      required this.HideText,
      required this.IconSize,
      required this.controller,
      required this.type});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: type,
      obscureText: HideText,
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.start,
      textInputAction: TextInputAction.none,
      autofocus: false,
      decoration: InputDecoration(
        fillColor: Color.fromARGB(179, 224, 217, 217),
        filled: true,
        prefixIcon: Icon(
          TextFieldIcon,
          color: Colors.black,
          size: IconSize,
        ),
        label: Text(
          IconLabel,
          style: GoogleFonts.poppins(
            fontSize: LabelSize,
            color: Colors.black,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
