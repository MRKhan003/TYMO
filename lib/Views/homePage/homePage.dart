import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tyamo/Views/Auth/LogIn.dart';
import 'package:tyamo/Views/Widgets/dashboard/dashBoard.dart';
import 'package:tyamo/Views/Widgets/drawerElements/drawer_elements.dart';
import 'package:tyamo/Views/profile/profilePage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //const HomePage({super.key});
  List<IconData> iconsList = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.bell,
    FontAwesomeIcons.circleUser,
  ];

  int page = 0;
  int pageView = 0;
  PageController pageController = PageController(initialPage: 0);
  Widget pageViewSection() {
    return PageView(
      controller: pageController,
      onPageChanged: (value) {
        setState(() {
          page = value;
        });
      },
      children: [
        Container(
          color: Colors.black,
        ),
        MyDashboard(),
        myProfile(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(213, 255, 255, 255),
        foregroundColor: Colors.black,
        elevation: 1,
        title: Text(
          "TYAMO",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SizedBox(
              width: 50,
              //height: 20,
              child: Image.asset(
                "assets/images/fbmessenger_logo.width-250.jpg",
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        //backgroundColor: Colors.yellow,
        width: 350,
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 80,
                          height: 80,
                          child: CircularProfileAvatar(
                            "",
                            backgroundColor: Colors.cyan,
                            borderColor: Colors.purple,
                            borderWidth: 2,
                            radius: 40,
                            elevation: 20,
                            errorWidget: (context, url, error) {
                              return Icon(Icons.face);
                            },
                            onTap: () {
                              pageController.animateToPage(
                                2,
                                duration: Duration(milliseconds: 3),
                                curve: Curves.linear,
                              );
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Muhammad Roshaan\n Khan",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "roshaankhan960@gmail.com",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                color: Colors.blue,
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: Text(
                        "Premium",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 0,
              child: Column(
                children: [
                  Divider(),
                  drawerItems(
                    listicon: FontAwesomeIcons.solidCreditCard,
                    listiconText: "Subscribe",
                  ),
                  drawerItems(
                    listicon: FontAwesomeIcons.gear,
                    listiconText: "Setting",
                  ),
                  drawerItems(
                    listicon: FontAwesomeIcons.circleQuestion,
                    listiconText: "Help",
                  ),
                  drawerItems(
                    listicon: FontAwesomeIcons.message,
                    listiconText: "Feedback",
                  ),
                  drawerItems(
                    listicon: FontAwesomeIcons.share,
                    listiconText: "Tell others",
                  ),
                  drawerItems(
                    listicon: FontAwesomeIcons.starHalfStroke,
                    listiconText: "Subscribe",
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(),
                  GestureDetector(
                    onTap: () {
                      Duration(
                        milliseconds: 3,
                      );
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          child: LogIn(),
                          type: PageTransitionType.fade,
                        ),
                      );
                    },
                    child: drawerItems(
                      listicon: FontAwesomeIcons.signOut,
                      listiconText: "Sign out",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Color.fromARGB(213, 255, 255, 255),
        activeColor: Colors.blue,
        inactiveColor: Colors.black,
        borderColor: Colors.black,
        //notchMargin: 10,
        notchSmoothness: NotchSmoothness.softEdge,
        //leftCornerRadius: 20,
        //rightCornerRadius: 20,
        gapLocation: GapLocation.none,
        icons: iconsList,
        activeIndex: page,
        onTap: (p0) {
          setState(
            () {
              pageView = p0;
              pageController.animateToPage(
                p0,
                duration: Duration(milliseconds: 3),
                curve: Curves.linear,
              );
            },
          );
        },
      ),
      body: pageViewSection(),
    );
  }
}
