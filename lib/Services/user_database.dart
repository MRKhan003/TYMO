import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tyamo/Model/our_user.dart';

class userDatabase {
  final FirebaseFirestore fbfObject = FirebaseFirestore.instance;
  Future<bool> enterUsertoDatabase(our_user user) async {
    try {
      await fbfObject.collection("Users").doc(user.userID).set({
        "userID": user.userID,
        "userName": user.userName,
        "userEmail": user.userEmail,
        "userPassword": user.password,
        "displayName": user.displayName,
        " avatarURL": user.avatarURL,
        "friendURL": user.friendURL,
        "chatRoomId": user.chatRoomId,
        "userPhone": user.phone,
        "userGender": user.gender,
        "accountCreated": Timestamp.now(),
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<our_user> getUserbyID(String uid) async {
    our_user setUser = our_user();
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await fbfObject
        .collection("Users")
        .doc("dC7uaYewwMOAK6KhBvfYXH8JRkj1")
        .get();
    setUser.userID = documentSnapshot.data()!["uid"];
    setUser.userName = documentSnapshot.data()!["userName"];
    setUser.displayName = documentSnapshot.data()!["displayName"];
    setUser.password = documentSnapshot.data()!["password"];
    setUser.accountCreated = documentSnapshot.data()!["accountCreated"];
    setUser.avatarURL = documentSnapshot.data()!["avatarURL"];
    setUser.friendURL = documentSnapshot.data()!["friendURL"];
    setUser.gender = documentSnapshot.data()!["gender"];
    setUser.chatRoomId = documentSnapshot.data()!["chatRoomID"];
    setUser.phone = documentSnapshot.data()!["phone"];
    setUser.userEmail = documentSnapshot.data()!["userEmail"];
    return setUser;
  }
}
