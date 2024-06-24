import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyamo/Controller/userController/user_controller.dart';
import 'package:tyamo/Root/rootFunc.dart';
import 'package:tyamo/Views/Auth/SplashScreen/splashLoader.dart';

class splashScreen extends StatelessWidget {
  user_controller splashController = user_controller();
  @override
  Widget build(BuildContext context) {
    splashController = Provider.of<user_controller>(context, listen: false);
    if (splashController.currentUser.userID == null) {
      return FutureBuilder(
        future: splashController.checkLoginInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return rootFunc();
          } else {
            return SplashAnimator();
          }
        },
      );
    } else {
      return rootFunc();
    }
  }
}
