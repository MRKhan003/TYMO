import 'package:flutter/material.dart';
import 'package:tyamo/Controller/userController/user_controller.dart';

class registerServices {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController cPassController = TextEditingController();

  user_controller currentUser = user_controller();

  // Future<bool> registertoFirebase(String email, String password) {
  //   return false;
  // }
}
