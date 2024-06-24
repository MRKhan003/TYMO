import 'package:cloud_firestore/cloud_firestore.dart';

class our_user {
  String? userName;
  String? userID;
  String? userEmail;
  String? password;
  String? displayName;
  String? avatarURL;
  String? friendURL;
  String? chatRoomId;
  String? phone;
  String? gender;
  bool? isLoadingStartupData;
  Timestamp? accountCreated;

  our_user({
    this.userName,
    this.userID,
    this.userEmail,
    this.password,
    this.displayName,
    this.avatarURL,
    this.friendURL,
    this.chatRoomId,
    this.phone,
    this.gender,
    this.isLoadingStartupData,
    this.accountCreated,
  });
}
