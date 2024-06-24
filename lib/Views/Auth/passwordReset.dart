import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:tyamo/Interfaces/Auth/forgotPasswordServices.dart';
import 'package:tyamo/Views/Widgets/Auth/authTextField.dart';
import 'package:tyamo/Views/Widgets/Auth/auth_heading.dart';

class PasswordReset extends StatelessWidget {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  final forgotPasswordServices newServices = forgotPasswordServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("TYAMO"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 3, 32, 56),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            authHeading(
              mainText: "Forgot your password? ",
              subText: "",
              assetsImagePath: "assets/images/download.png",
              textSize: 16,
              imageSize: 25,
            ),
            SizedBox(
              height: 1,
            ),
            Container(
              width: 300,
              child: Image.asset(
                "assets/images/forgetPassword.jpg",
                filterQuality: FilterQuality.high,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "To request a new one, type your email address below. A \n link to reset password will be sent to that emial.",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            authTextField(
              TextFieldIcon: Icons.email,
              IconLabel: "Email",
              type: TextInputType.emailAddress,
              controller: newServices.emailController,
              LabelSize: 16,
              HideText: false,
              IconSize: 18,
            ),
            SizedBox(
              height: 20,
            ),
            RoundedLoadingButton(
              color: Color(0xff00C1AA),
              controller: _btnController,
              onPressed: () {
                print("Email for pssword reset send");
              },
              child: Text(
                "Send",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
