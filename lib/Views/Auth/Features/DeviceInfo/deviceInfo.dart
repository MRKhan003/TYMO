import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tyamo/Views/Auth/Features/DeviceInfo/gradientButton.dart';

class myDeviceinfo extends StatelessWidget {
  const myDeviceinfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          "TYAMO",
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            alignment: Alignment.center,
            child: Text(
              "Device Info",
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 10,
                              child: gradientButton(
                                buttonText: Text("User Status"),
                                clr: [
                                  Colors.blue,
                                  Colors.red,
                                ],
                                isGradientVertical: true,
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: gradientButton(
                                buttonText: Text("Battery"),
                                clr: [
                                  Colors.pinkAccent,
                                  Colors.blue,
                                ],
                                isGradientVertical: false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: gradientButton(
                          buttonText: Text("General"),
                          clr: [
                            Colors.greenAccent,
                            Colors.blueAccent,
                          ],
                          isGradientVertical: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: gradientButton(
                          buttonText: Text("Device Specs"),
                          clr: [
                            Colors.pinkAccent,
                            Colors.blue,
                          ],
                          isGradientVertical: false,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 4,
                              child: gradientButton(
                                buttonText: Text("Location"),
                                clr: [
                                  Colors.greenAccent,
                                  Colors.blueAccent,
                                ],
                                isGradientVertical: true,
                              ),
                            ),
                            Expanded(
                              flex: 10,
                              child: gradientButton(
                                buttonText: Text("Orientation"),
                                clr: [
                                  Colors.greenAccent,
                                  Colors.blueAccent,
                                ],
                                isGradientVertical: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
