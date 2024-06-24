// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tyamo/Views/Invitation/invite_friend.dart';

class FriendInvitaion extends StatelessWidget {
  const FriendInvitaion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          height: 300,
          width: 300,
          child: Image.asset(
            "assets/images/fiverr.jpg",
            filterQuality: FilterQuality.high,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: InviteFriend(),
              ),
            );
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
            //opticalSize: 60,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 50,
              color: Colors.purple,
              child: Text(
                "See received invitations",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                // textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              //height: 90,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  //color: Colors.black,
                  height: 100,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 20, 5, 15),
                            child: Container(
                              height: 60,
                              width: 60,
                              child: CircularProfileAvatar(
                                "",
                                backgroundColor: Colors.amber,
                                radius: 35,
                                initialsText: Text(
                                  "+",
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
                                child: Text(
                                  "@roshaan003",
                                  style: GoogleFonts.poppins(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 0.0),
                                child: Text(
                                  "Roshaan",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                GFButton(
                                  onPressed: () {},
                                  color: Colors.blue,
                                  child: Text("Accept"),
                                  shape: GFButtonShape.pills,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GFButton(
                                  onPressed: () {},
                                  color: Colors.red,
                                  child: Text("Reject"),
                                  shape: GFButtonShape.pills,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              //height: 100,
              width: 300,
              child: Image.asset(
                "assets/images/delivery.jpg",
                filterQuality: FilterQuality.high,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your received invitations are currently ",
                  style: GoogleFonts.poppins(
                    color: Colors.cyan,
                  ),
                ),
                Text(
                  "EMPTY",
                  style: GoogleFonts.poppins(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
