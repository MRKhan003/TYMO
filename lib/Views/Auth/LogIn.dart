import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:tyamo/Controller/userController/user_controller.dart';
import 'package:tyamo/Interfaces/Auth/loginServices.dart';
import 'package:tyamo/Views/Auth/passwordReset.dart';
import 'package:tyamo/Views/Auth/registration.dart';
import 'package:tyamo/Views/Widgets/Auth/authTextField.dart';
import 'package:tyamo/Views/Widgets/Auth/auth_heading.dart';
import 'package:tyamo/Views/homePage/homePage.dart';
import 'package:tyamo/Views/profile/profile_setup.dart';

class LogIn extends StatelessWidget {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  final loginServices newServices = loginServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        title: Text(
          "TYAMO",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              authHeading(
                mainText: "Sign in to ",
                subText: "to connect with friends",
                assetsImagePath: "assets/images/download.png",
                imageSize: 25.sp,
                textSize: 18.sp,
              ),
              SizedBox(
                height: 30,
              ),
              authTextField(
                TextFieldIcon: Icons.email,
                IconLabel: "Email",
                type: TextInputType.emailAddress,
                controller: newServices.emailController,
                LabelSize: 14,
                HideText: false,
                IconSize: 20,
              ),
              SizedBox(
                height: 30,
              ),
              authTextField(
                TextFieldIcon: Icons.password_outlined,
                IconLabel: "Password",
                type: TextInputType.text,
                controller: newServices.passController,
                LabelSize: 14,
                HideText: true,
                IconSize: 20,
              ),
              SizedBox(
                height: 30,
              ),
              Hero(
                tag: "Auth",
                child: RoundedLoadingButton(
                  width: 2000,
                  borderRadius: 10,
                  color: Color(0xff00C1AA),
                  controller: _btnController,
                  onPressed: () {
                    user_controller().loginUser(
                      newServices.emailController.text,
                      newServices.passController.text,
                    );
                  },
                  child: Text(
                    "Login",
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: PasswordReset(),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      color: Colors.red,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont have an account? ",
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: Registration(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
