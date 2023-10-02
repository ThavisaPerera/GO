// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_app2/themes/theme_colors.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkModeEnabled
          ? darkModeColors["darkBG"]
          : lightModeColors["lightBG"],
      body: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 15, left: 25, right: 25),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isDarkModeEnabled
                                  ? darkModeColors["white"]
                                  : lightModeColors["black"],),
                ),
                Spacer(),
                Positioned(
                  top: 0,
                  right: 0,
                  
                    child: SvgPicture.asset(
                      'assets/icons/search_FILL0_wght400_GRAD0_opsz48.svg',
                      width: 20,
                      color: isDarkModeEnabled
                                  ? darkModeColors["white"]
                                  : lightModeColors["black"],
                    ),
    
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                    width: 150,
                    height: 124,
                    decoration: BoxDecoration(
                        color: isDarkModeEnabled
                                  ? darkModeColors["purple1"]
                                  : lightModeColors["blue1"],
                        borderRadius: BorderRadius.circular(6)),
                    child: Stack(
                      children: [
                        Positioned(
                            top: 10,
                            left: 10,
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: isDarkModeEnabled
                                  ? darkModeColors["purple"]
                                  : lightModeColors["blue"],
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/images/fashion.svg',
                                  width: 40,
                                  height: 40,
      
                                  color: Colors.white,
                                ),
                              ),
                            )),
                        Positioned(
                          top: 100,
                          right: 10,
                          child: Center(
                            child: Text(
                              'Fashion',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                Spacer(),
                Container(
                    width: 150,
                    height: 124,
                    decoration: BoxDecoration(
                        color: isDarkModeEnabled
                                  ? darkModeColors["purple1"]
                                  : lightModeColors["blue1"],
                        borderRadius: BorderRadius.circular(6)),
                    child: Stack(
                      children: [
                        Positioned(
                            top: 10,
                            left: 10,
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: isDarkModeEnabled
                                  ? darkModeColors["purple"]
                                  : lightModeColors["blue"],
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/images/car.svg',
                                  width: 40,
                                  height: 40,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                        Positioned(
                          top: 100,
                          right: 10,
                          child: Center(
                            child: Text(
                              'Vehicles',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                    width: 150,
                    height: 124,
                    decoration: BoxDecoration(
                        color: isDarkModeEnabled
                                  ? darkModeColors["purple1"]
                                  : lightModeColors["blue1"],
                        borderRadius: BorderRadius.circular(6)),
                    child: Stack(
                      children: [
                        Positioned(
                            top: 10,
                            left: 10,
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: isDarkModeEnabled
                                  ? darkModeColors["purple"]
                                  : lightModeColors["blue"],
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/images/laptop.svg',
                                  width: 40,
                                  height: 40,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                        Positioned(
                          top: 100,
                          right: 10,
                          child: Center(
                            child: Text(
                              'Electronics',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                Spacer(),
                Container(
                    width: 150,
                    height: 124,
                    decoration: BoxDecoration(
                        color: isDarkModeEnabled
                                  ? darkModeColors["purple1"]
                                  : lightModeColors["blue1"],
                        borderRadius: BorderRadius.circular(6)),
                    child: Stack(
                      children: [
                        Positioned(
                            top: 10,
                            left: 10,
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: isDarkModeEnabled
                                  ? darkModeColors["purple"]
                                  : lightModeColors["blue"],
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/images/beauty.svg',
                                  width: 40,
                                  height: 40,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                        Positioned(
                          top: 100,
                          right: 10,
                          child: Center(
                            child: Text(
                              'Beauty',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                    width: 150,
                    height: 124,
                    decoration: BoxDecoration(
                        color: isDarkModeEnabled
                                  ? darkModeColors["purple1"]
                                  : lightModeColors["blue1"],
                        borderRadius: BorderRadius.circular(6)),
                    child: Stack(
                      children: [
                        Positioned(
                            top: 10,
                            left: 10,
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: isDarkModeEnabled
                                  ? darkModeColors["purple"]
                                  : lightModeColors["blue"],
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/images/jewellery.svg',
                                  width: 40,
                                  height: 40,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                        Positioned(
                          top: 100,
                          right: 10,
                          child: Center(
                            child: Text(
                              'Jewellery',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                Spacer(),
                Container(
                    width: 150,
                    height: 124,
                    decoration: BoxDecoration(
                        color: isDarkModeEnabled
                                  ? darkModeColors["purple1"]
                                  : lightModeColors["blue1"],
                        borderRadius: BorderRadius.circular(6)),
                    child: Stack(
                      children: [
                        Positioned(
                            top: 10,
                            left: 10,
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: isDarkModeEnabled
                                  ? darkModeColors["purple"]
                                  : lightModeColors["blue"],
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/images/footwear.svg',
                                  width: 40,
                                  height: 40,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                        Positioned(
                          top: 100,
                          right: 10,
                          child: Center(
                            child: Text(
                              'Footwear',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                    width: 150,
                    height: 124,
                    decoration: BoxDecoration(
                        color: isDarkModeEnabled
                                  ? darkModeColors["purple1"]
                                  : lightModeColors["blue1"],
                        borderRadius: BorderRadius.circular(6)),
                    child: Stack(
                      children: [
                        Positioned(
                            top: 10,
                            left: 10,
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: isDarkModeEnabled
                                  ? darkModeColors["purple"]
                                  : lightModeColors["blue"],
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/images/toy.svg',
                                  width: 40,
                                  height: 40,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                        Positioned(
                          top: 100,
                          right: 10,
                          child: Center(
                            child: Text(
                              'Toy',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                Spacer(),
                Container(
                    width: 150,
                    height: 124,
                    decoration: BoxDecoration(
                        color: isDarkModeEnabled
                                  ? darkModeColors["purple1"]
                                  : lightModeColors["blue1"],
                        borderRadius: BorderRadius.circular(6)),
                    child: Stack(
                      children: [
                        Positioned(
                            top: 10,
                            left: 10,
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: isDarkModeEnabled
                                  ? darkModeColors["purple"]
                                  : lightModeColors["blue"],
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/images/mobile.svg',
                                  width: 40,
                                  height: 40,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                        Positioned(
                          top: 100,
                          right: 10,
                          child: Center(
                            child: Text(
                              'Mobile',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
