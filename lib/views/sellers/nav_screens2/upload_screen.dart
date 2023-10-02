// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_app2/themes/theme_colors.dart';
import 'package:go_app2/views/sellers/nav_screens2/attributes_screen.dart';
import 'package:go_app2/views/sellers/nav_screens2/images_screen.dart';
import 'package:go_app2/views/sellers/nav_screens2/shipping_screen.dart';

import 'general_screen.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkModeEnabled
          ? darkModeColors["darkBG"]
          : lightModeColors["lightBG"],
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Material(
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Container(
                  height: 30,
                  color: const Color.fromARGB(0, 255, 255, 255),
                  child: TabBar(
                    physics: const ClampingScrollPhysics(),
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.white, // Selected tab text color
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Color.fromARGB(255, 36, 76, 255)),
                      color: isDarkModeEnabled
                          ? darkModeColors["purple"]
                          : lightModeColors["blue"],
                    ),
                    tabs: [
                      Tab(
                        child: Container(
                          width: 100, // Set the width here
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: Color.fromARGB(255, 36, 76, 255)),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "General",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight:
                                      FontWeight.bold), // Set the font size here
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          width: 100, // Set the width here
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: Color.fromARGB(255, 36, 76, 255)),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Shipping",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight:
                                      FontWeight.bold), // Set the font size here
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          width: 100, // Set the width here
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: Color.fromARGB(255, 36, 76, 255)),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Attributes",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight:
                                      FontWeight.bold), // Set the font size here
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          width: 100, // Set the width here
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: Color.fromARGB(255, 36, 76, 255)),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Images",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight:
                                      FontWeight.bold), // Set the font size here
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  GeneralScreen(),
                  ShippingScreen(),
                  AttributesScreen(),
                  ImagesScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
