import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tyamo/Views/Widgets/Auth/authTextField.dart';
import 'package:tyamo/Views/profile/profileSettings.dart';

class myProfile extends StatefulWidget {
  @override
  State<myProfile> createState() => _myProfileState();
}

class _myProfileState extends State<myProfile> {
  bool more = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "My Profile",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              child: CircularProfileAvatar(
                "assets/images/icons8-grinning-face-40.png",
                imageFit: BoxFit.fill,
                radius: 65,
                borderColor: Colors.deepPurple,
                borderWidth: 1,
                backgroundColor: Colors.tealAccent,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                "Muhammad Roshaan Khan",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                "@mrkhan",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      20,
                    ),
                  ),
                ),
                side: BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.deepPurple,
                ),
                shadowColor: Colors.deepPurple,
                elevation: 5,
              ),
              onPressed: () {
                setState(() {
                  Duration(milliseconds: 2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => myProfileSeter(),
                    ),
                  );
                });
              },
              child: Text(
                "Edit Profile Details",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: CardDetailRow(
                cardIcon: Icons.alternate_email,
                cardType: "Email",
                cardVal: "roshaankhan960@gmail.com",
                cardColor: Color.fromARGB(255, 233, 228, 228),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: CardDetailRow(
                cardIcon: Icons.flag,
                cardType: "Country",
                cardVal: "Pakistan",
                cardColor: Color.fromARGB(255, 233, 228, 228),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: CardDetailRow(
                cardIcon: Icons.phone,
                cardType: "Phone Number",
                cardVal: "Not set",
                cardColor: Color.fromARGB(255, 233, 228, 228),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: more
                  ? CardDetailRow(
                      cardIcon: Icons.person,
                      cardType: "Gender",
                      cardVal: "Male",
                      cardColor: Color.fromARGB(255, 233, 228, 228),
                    )
                  : Container(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: more
                  ? CardDetailRow(
                      cardIcon: Icons.duo,
                      cardType: "Partner",
                      cardVal: "Not set",
                      cardColor: Color.fromARGB(255, 233, 228, 228),
                    )
                  : Container(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: more
                  ? CardDetailRow(
                      cardIcon: Icons.code,
                      cardType: "Postal Code",
                      cardVal: "54000",
                      cardColor: Color.fromARGB(255, 233, 228, 228),
                    )
                  : Container(),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 231, 220, 220),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      20,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                setState(() {
                  more = !more;
                });
              },
              child: Text(
                more ? "- Show Less" : "+ Show More",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardDetailRow extends StatelessWidget {
  final String cardVal;
  final IconData cardIcon;
  final Color cardColor;
  final String cardType;
  CardDetailRow({
    required this.cardIcon,
    required this.cardType,
    required this.cardVal,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Icon(
                cardIcon,
                size: 24,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                cardType,
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      cardVal,
                      textAlign: TextAlign.right,
                      style: GoogleFonts.poppins(
                        color: cardVal == "Not set"
                            ? const Color.fromARGB(255, 175, 35, 25)
                            : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
