// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'dart:async';
import 'dart:io';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:tyamo/Interfaces/Auth/profileSetupServices.dart';
//import 'package:tyamo/Views/Invitation/ivite_friend.dart';
import 'package:tyamo/Views/Widgets/Auth/authTextField.dart';
import 'package:image/image.dart' as im;
import 'package:uuid/uuid.dart';

import '../Invitation/invite_friend.dart';

class ProfileSetup extends StatefulWidget {
  const ProfileSetup({super.key});

  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  final profileSetupServices newServices = profileSetupServices();

  bool isMale = true;
  File? file;
  bool isUploading = false;
  ImagePicker img = ImagePicker();
  String postId = Uuid().v4();

  handleChooseFromGallery() async {
    var pickImage = await img.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1080,
      maxHeight: 960,
    );
    File imgFile = File(pickImage!.path);

    setSTate() {
      file = imgFile;
    }

    uploadinFromStorage() async {
      isUploading = true;
    }

    if (file != null) {}
    await compressImage();
    String? storage = await uploadImage();

    // if (storage != null) {
    //   await uploadAvatartoFirestore();
    // }
    // uploadAvatartoFirestore({String mediaUrl,String uid})async{

    //   await FirebaseFirestore.instance.collection("Users").doc().update({"avatarURl":mediaUrl})

    // }
  }

  Future<String?> uploadImage() async {
    UploadTask uploadTask = FirebaseStorage.instance
        .ref()
        .child("profilepicture/$postId.jpg")
        .putFile(file!);
    String? downloadURL;
    uploadTask.then((p0) async {
      downloadURL = await p0.ref.getDownloadURL();
    });
    return downloadURL;
  }

  compressImage() async {
    final tempFile = await getTemporaryDirectory();
    final path = tempFile.path;
    im.Image? imageFile = im.decodeImage(file!.readAsBytesSync());
    final compressedFile = File("$path/image_$postId.jpg")
      ..writeAsBytesSync(
        im.encodeJpg(imageFile!),
      );
    setState(() {
      file = compressedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 200,
          height: 200,
          child: Image.asset(
            "assets/images/fiverr.jpg",
            filterQuality: FilterQuality.high,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      //backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          // alignment: Alignment.topCenter,
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 60,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 9, 48, 68),
                ),
                child: Text(
                  "Profile Setup",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              CircularProfileAvatar(
                '',
                onTap: () {
                  print("Tapped");
                  handleChooseFromGallery();
                },
                backgroundColor: Colors.cyan,
                radius: 55,
                initialsText: Text(
                  "+",
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: authTextField(
                  TextFieldIcon: Icons.face,
                  IconLabel: "Your Name",
                  type: TextInputType.name,
                  controller: newServices.displayName,
                  LabelSize: 16.sp,
                  HideText: false,
                  IconSize: 16,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: authTextField(
                  TextFieldIcon: Icons.alternate_email,
                  IconLabel: "Your Username",
                  type: TextInputType.name,
                  controller: newServices.userName,
                  LabelSize: 16.sp,
                  HideText: false,
                  IconSize: 16,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      //color: Colors.cyan,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isMale ? Colors.cyan : Colors.grey,
                      ),
                      child: const Icon(
                        Icons.male,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      //color: Colors.purple,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: !isMale ? Colors.purple : Colors.grey,
                      ),
                      child: const Icon(
                        Icons.female,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              RoundedLoadingButton(
                controller: _btnController,
                onPressed: () {
                  Timer(
                    Duration(seconds: 3),
                    () {
                      _btnController.success();
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: InviteFriend(),
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  "Send",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
