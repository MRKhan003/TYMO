import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class myGallery extends StatefulWidget {
  @override
  State<myGallery> createState() => _myGalleryState();
}

class _myGalleryState extends State<myGallery> {
  int page = 0;

  int pageView = 0;

  PageController pageController = new PageController(initialPage: 0);

  Widget pageViewSection() {
    return PageView(
      controller: pageController,
      onPageChanged: (value) {
        setState(() {
          page = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
          AnimatedBottomNavigationBar(
            icons: [
              Icons.person,
              Icons.person_2_sharp,
            ],
            activeIndex: 0,
            onTap: (p0) {},
          ),
        ],
      ),
    );
  }
}
