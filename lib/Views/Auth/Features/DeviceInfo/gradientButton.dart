import 'package:flutter/material.dart';

class gradientButton extends StatelessWidget {
  final Text buttonText;
  final List<Color> clr;
  final bool isGradientVertical;

  gradientButton({
    required this.buttonText,
    required this.clr,
    required this.isGradientVertical,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 10,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: isGradientVertical
                  ? Alignment.topCenter
                  : Alignment.centerLeft,
              end: isGradientVertical == true
                  ? Alignment.bottomCenter
                  : Alignment.centerRight,
              colors: clr,
            ),
          ),
          child: ElevatedButton(
            onPressed: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buttonText,
              ],
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
