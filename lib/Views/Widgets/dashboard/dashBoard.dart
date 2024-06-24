import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tyamo/Views/Widgets/dashboard/dashboardContainer.dart';
import 'package:tyamo/Views/Widgets/dashboard/featuresContainer.dart';

class MyDashboard extends StatelessWidget {
  const MyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //color: Colors.amber,
              alignment: Alignment.topCenter,
              child: Text(
                "DASHBOARD",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Your Friend",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  color: Colors.amber,
                  shadowColor: Colors.black,
                  elevation: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularProfileAvatar(
                                "",
                                borderWidth: 2,
                                radius: 40,
                                borderColor: Colors.blue,
                                elevation: 10,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.fiber_manual_record,
                                        size: 18,
                                        color: Colors.green,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Roshaan",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: 18,
                                        color: Colors.blue,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Gulshan-e-Ravi ,Lahore",
                                          style: GoogleFonts.poppins(
                                            //fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Status"),
                                  Text(
                                    "Offline",
                                    style: GoogleFonts.poppins(
                                      color: Colors.purple,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: 5,
                              child: Container(
                                color: Colors.purple,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("User Status"),
                                  Text(
                                    "N/A",
                                    style: GoogleFonts.poppins(
                                      color: Colors.purple,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: 5,
                              child: Container(
                                color: Colors.purple,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("User Mood"),
                                  Text(
                                    "N/A",
                                    style: GoogleFonts.poppins(
                                      color: Colors.purple,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Flexible(
                  child: MyDashBoardGradient(
                    imageIcon: "assets/images/icons8-device-40.png",
                    imageText: "Device Info",
                    clr: [Colors.white, Colors.blue],
                  ),
                ),
                Flexible(
                  child: MyDashBoardGradient(
                    imageIcon: "assets/images/icons8-gallery-40.png",
                    imageText: "Active Status",
                    clr: [Colors.white, Colors.blue],
                  ),
                ),
                Flexible(
                  child: MyDashBoardGradient(
                    imageIcon: "assets/images/icons8-grinning-face-40.png",
                    imageText: "Mood",
                    clr: [Colors.white, Colors.blue],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Our Features",
                  style: GoogleFonts.poppins(
                    color: Colors.blueGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: featureContainer(
                    imageIcon: "assets/images/icons8-grinning-face-40.png",
                    imageText: "imageText",
                    clr: [Colors.deepOrange, Colors.yellow],
                  ),
                ),
                Flexible(
                  child: featureContainer(
                    imageIcon: "assets/images/icons8-grinning-face-40.png",
                    imageText: "imageText",
                    clr: [Colors.deepOrange, Colors.yellow],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                  child: featureContainer(
                    imageIcon: "assets/images/icons8-grinning-face-40.png",
                    imageText: "imageText",
                    clr: [Colors.deepOrange, Colors.yellow],
                  ),
                ),
                Flexible(
                  child: featureContainer(
                    imageIcon: "assets/images/icons8-grinning-face-40.png",
                    imageText: "imageText",
                    clr: [Colors.deepOrange, Colors.yellow],
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
