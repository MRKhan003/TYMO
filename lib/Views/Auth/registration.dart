import 'package:achievement_view/achievement_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:tyamo/Controller/userController/user_controller.dart';
import 'package:tyamo/Interfaces/Auth/registerServices.dart';
import 'package:tyamo/Views/Auth/LogIn.dart';
import 'package:tyamo/Views/profile/profile_setup.dart';

import '../Widgets/Auth/authTextField.dart';
import '../Widgets/Auth/auth_heading.dart';

class Registration extends StatelessWidget {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  final registerServices newController = registerServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "TYAMO",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            authHeading(
              mainText: "Sign up to Tyamo",
              subText:
                  "Create a Personalized Trade \n Stradegy and Start Wining",
              assetsImagePath: "assets/images/download.png",
              imageSize: 30,
              textSize: 14,
            ),
            SizedBox(
              height: 10,
            ),
            authTextField(
              TextFieldIcon: Icons.email,
              IconLabel: "Email",
              type: TextInputType.emailAddress,
              controller: newController.emailController,
              LabelSize: 14,
              HideText: false,
              IconSize: 20,
            ),
            SizedBox(
              height: 10,
            ),
            // authTextField(
            //   TextFieldIcon: Icons.verified_user,
            //   IconLabel: "Username",
            //   LabelSize: 14,
            //   HideText: false,
            //   IconSize: 20,
            // ),
            SizedBox(
              height: 10,
            ),
            authTextField(
              TextFieldIcon: Icons.password,
              IconLabel: "Password",
              controller: newController.passController,
              type: TextInputType.text,
              LabelSize: 14,
              HideText: true,
              IconSize: 20,
            ),
            SizedBox(
              height: 10,
            ),
            authTextField(
              TextFieldIcon: Icons.password,
              IconLabel: "Confirm Password",
              type: TextInputType.text,
              controller: newController.cPassController,
              LabelSize: 14,
              HideText: true,
              IconSize: 20,
            ),
            SizedBox(
              height: 10,
            ),
            // authTextField(
            //   TextFieldIcon: Icons.supervised_user_circle,
            //   IconLabel: "Referal Code",
            //   LabelSize: 14,
            //   HideText: false,
            //   IconSize: 20,
            // ),
            SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "* ignore if you are not reffered by any one",
                style: GoogleFonts.poppins(
                  fontSize: 8,
                  color: Colors.red,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Hero(
              tag: "Auth",
              child: RoundedLoadingButton(
                width: 2000,
                borderRadius: 10,
                color: Color(0xff00C1AA),
                controller: _btnController,
                onPressed: () {
                  //user_controller().registration();
                  if (newController.passController.text ==
                      newController.cPassController.text) {
                    user_controller().registration(
                      newController.emailController.text,
                      newController.passController.text,
                    );
                  } else {
                    AchievementView(
                        title: "Error!",
                        subTitle: "Password doesn't match",
                        //content: Widget()
                        //onTab: _onTabAchievement,
                        //icon: Icon(Icons.insert_emoticon, color: Colors.white,),
                        //typeAnimationContent: AnimationTypeAchievement.fadeSlideToUp,
                        //borderRadius: 5.0,
                        //color: Colors.blueGrey,
                        //textStyleTitle: TextStyle(),
                        //textStyleSubTitle: TextStyle(),
                        //alignment: Alignment.topCenter,
                        //duration: Duration(seconds: 3),
                        //isCircle: false,
                        listener: (status) {
                          print(status);
                          //AchievementState.opening
                          //AchievementState.open
                          //AchievementState.closing
                          //AchievementState.closed
                        }).show(context);
                  }
                  //print(newController.emailController.text);
                },
                child: Text(
                  "Sign Up",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "By registering you agree to our terms and conditions",
                style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: LogIn(),
                      ),
                    );
                  },
                  child: Text(
                    "Sign In",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
