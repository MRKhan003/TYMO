import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyamo/Views/Widgets/profileWidgets/prSettingsElements.dart';
import 'package:tyamo/Views/Widgets/profileWidgets/prSettingsHeading.dart';

class myProfileSeter extends StatelessWidget {
  const myProfileSeter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                    MediaQuery.of(context).size.width,
                    130,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context, true);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      Text(
                        "Settings",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 20,
                            ),
                            child: Container(
                              child: Row(
                                children: [
                                  CircularProfileAvatar(
                                    '',
                                    backgroundColor: Colors.cyan,
                                    radius: 30,
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "Muhammad Roshaan Khan",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            height: 5,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          settingsHead(
                            headText: "Profile Setting",
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          settingsElement(
                            elementText: "Edit Name",
                            elementIcon: Icons.arrow_circle_right,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          settingsElement(
                            elementText: "Edit Phone Number",
                            elementIcon: Icons.arrow_circle_right,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          settingsElement(
                            elementText: "Change Password",
                            elementIcon: Icons.arrow_circle_right,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          settingsElement(
                            elementText: "Email Status",
                            elementIcon: Icons.arrow_circle_right,
                            secondaryWidget: Row(
                              children: [
                                Text(
                                  "Not Verified",
                                  style: GoogleFonts.poppins(
                                    color: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.arrow_circle_right,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          settingsHead(
                            headText: "Notification Settings",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          settingsElement(
                            elementText: "Change Password",
                            elementIcon: Icons.arrow_circle_right,
                            secondaryWidget: GFToggle(
                              enabledTrackColor: Colors.green,
                              onChanged: (val) {},
                              value: true,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          settingsHead(
                            headText: "Application Settings",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          settingsElement(
                            elementText: "Background Updates",
                            elementIcon: Icons.arrow_circle_right,
                            secondaryWidget: Row(
                              children: [
                                Text(
                                  "Not Verified",
                                  style: GoogleFonts.poppins(
                                    color: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.arrow_circle_right,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 120,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
