import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:tyamo/Model/our_user.dart';
import 'package:tyamo/Services/user_database.dart';

class user_controller with ChangeNotifier {
  our_user currentUser = our_user();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore fbObject = FirebaseFirestore.instance;
  Future<bool> registration(String email, String password) async {
    our_user user = our_user();
    try {
      UserCredential authResult = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (authResult.user != null) {
        print("Send data to database");
        user.userID = authResult.user!.uid;
        user.userEmail = authResult.user!.email;
        user.password = password;
        // fbObject.collection("Users").doc(authResult.user!.uid).set({
        //   "userID": user.userID,
        //   "userName": user.userName,
        //   "userEmail": user.userEmail,
        //   "userPassword": user.password,
        //   "displayName": user.displayName,
        //   " avatarURL": user.avatarURL,
        //   "friendURL": user.friendURL,
        //   "chatRoomId": user.chatRoomId,
        //   "userPhone": user.phone,
        //   "userGender": user.gender,
        //   "accountCreated": Timestamp.now(),

        // });
        userDatabase().enterUsertoDatabase(user);
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> loginUser(String email, String password) async {
    try {
      UserCredential loginresult = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (loginresult.user != null) {
        currentUser = await userDatabase().getUserbyID(loginresult.user!.uid);
        print(currentUser.userEmail);
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> signoutUser() async {
    try {
      await auth.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<our_user> checkLoginInfo() async {
    our_user myUser = our_user();
    myUser.isLoadingStartupData = true;
    try {
      currentUser = myUser;
      auth.authStateChanges().listen((event) async {
        if (event?.uid == null) {
          myUser.userID = null;
          myUser.isLoadingStartupData = false;
          setCurrentUser(myUser);
        } else {
          myUser.userID = event?.uid;
          myUser = await userDatabase().getUserbyID(auth.currentUser!.uid);
          myUser.isLoadingStartupData = false;
          setCurrentUser(myUser);
        }
      });
      return myUser;
    } catch (e) {
      print(e);
      return null!;
    }
  }

  void setCurrentUser(our_user user) {
    currentUser = user;
    notifyListeners();
  }
}
