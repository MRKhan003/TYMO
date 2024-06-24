import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyamo/Controller/userController/user_controller.dart';
import 'package:tyamo/Views/Auth/LogIn.dart';
import 'package:tyamo/Views/Auth/SplashScreen/splash.dart';
import 'package:tyamo/Views/Auth/registration.dart';
import 'package:tyamo/Views/Invitation/invite_friend.dart';
import 'package:tyamo/Views/Widgets/dashboard/dashBoard.dart';
import 'package:tyamo/Views/profile/profile_setup.dart';

enum authentication {
  firstTime,
  authenticating,
  notLogedin,
  logedIn,
  noProfile,
  noFriend,
}

class rootFunc extends StatelessWidget {
  authentication authStatus = authentication.authenticating;

  @override
  Widget build(BuildContext context) {
    user_controller controller = user_controller();
    controller = Provider.of<user_controller>(
      context,
      listen: false,
    );
    return FutureBuilder(
      future: null,
      builder: (context, snapshot) {
        if (controller.currentUser.userID == null) {
          authStatus = authentication.notLogedin;
        }
        if (controller.currentUser.userID != null) {
          if (controller.currentUser.userName == null) {
            authStatus = authentication.noProfile;
          }
          if (controller.currentUser.userName != null &&
              controller.currentUser.friendURL == null) {
            authStatus = authentication.noFriend;
          }
          if (controller.currentUser.userName != null &&
              controller.currentUser.friendURL != null) {
            authStatus = authentication.logedIn;
          }
        }

        switch (authStatus) {
          case authentication.authenticating:
            return splashScreen();
          case authentication.noProfile:
            return ProfileSetup();
          case authentication.noFriend:
            return InviteFriend();
          case authentication.notLogedin:
            return LogIn();
          case authentication.logedIn:
            return ProfileSetup();

          default:
            return Registration();
        }
      },
    );
  }
}
