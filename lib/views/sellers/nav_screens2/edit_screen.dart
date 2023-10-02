// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_app2/themes/theme_colors.dart';
import 'package:go_app2/views/sellers/nav_screens2/published_screen.dart';
import 'package:go_app2/views/sellers/nav_screens2/unpublished_screen.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkModeEnabled
          ? darkModeColors["darkBG"]
          : lightModeColors["lightBG"],
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  'Manage Profile',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Material(
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
                              "Published",
                              style: TextStyle(
                                fontSize: 12, // Set the font size here
                                fontWeight: FontWeight.bold,
                              ),
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
                              "Unpublished",
                              style: TextStyle(
                                fontSize: 12, // Set the font size here
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
              Expanded(
                child: TabBarView(
                  children: [
                    PublishedScreen(),
                    UnpublishedScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
