// ignore_for_file: prefer_const_constructors, deprecated_member_use, use_build_context_synchronously, avoid_print, unused_field, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_app2/views/start/intro_screen.dart';
import 'package:go_app2/themes/theme_colors.dart';
import '../../sellers/post_screen.dart';
import 'edit_profile_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? currentUser;
  String defaultEmail = 'example@gmail.com'; // Set your default email here

  @override
  void initState() {
    super.initState();
    currentUser = _auth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkModeEnabled
          ? darkModeColors["darkBG"]
          : lightModeColors["lightBG"],
      body: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 15,
              left: 18,
              right: 18),
          child: Column(
            children: [
              Row(
                children: [
                  Center(
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isDarkModeEnabled
                            ? darkModeColors["white"]
                            : lightModeColors["black"],
                      ),
                    ),
                  ),
                  Spacer(),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Theme",
                        style: TextStyle(
                            fontSize: 16,
                            color: isDarkModeEnabled
                                ? darkModeColors["white"]
                                : lightModeColors["black"],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Switch.adaptive(
                    value: isDarkModeEnabled,
                    activeColor: isDarkModeEnabled
                        ? darkModeColors["white"]
                        : lightModeColors["black"],
                    onChanged: (value) {
                      setState(() {
                        isDarkModeEnabled = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 30),
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          color: Colors.grey, shape: BoxShape.circle),
                      child: Icon(
                        Icons.camera_alt,
                        size: 60,
                        color: isDarkModeEnabled
                            ? darkModeColors["black"]
                            : lightModeColors["white"],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      currentUser?.email ?? defaultEmail,
                      style: TextStyle(
                        fontSize: 13,
                        color: isDarkModeEnabled
                            ? darkModeColors["white"]
                            : lightModeColors["black"],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EditProfileScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 200,
                        height: 35,
                        decoration: BoxDecoration(
                            color: isDarkModeEnabled
                                ? darkModeColors["purple"]
                                : lightModeColors["blue"],
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Stack(
                children: [
                  Container(
                    width: 350,
                    height: 65,
                    decoration: BoxDecoration(
                        color: isDarkModeEnabled
                            ? darkModeColors["black"]
                            : lightModeColors["white"],
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 20,
                    child: SvgPicture.asset(
                      'assets/icons/settings_FILL0_wght400_GRAD0_opsz48.svg',
                      width: 40,
                      height: 40,
                      color: isDarkModeEnabled
                          ? darkModeColors["white"]
                          : lightModeColors["black"],
                    ),
                  ),
                  Positioned(
                    left: 100,
                    top: 22,
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        color: isDarkModeEnabled
                            ? darkModeColors["white"]
                            : lightModeColors["black"],
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Stack(
                children: [
                  Container(
                    width: 350,
                    height: 65,
                    decoration: BoxDecoration(
                        color: isDarkModeEnabled
                            ? darkModeColors["black"]
                            : lightModeColors["white"],
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 20,
                    child: SvgPicture.asset(
                      'assets/icons/shopping_cart_FILL0_wght400_GRAD0_opsz48.svg',
                      width: 40,
                      height: 40,
                      color: isDarkModeEnabled
                          ? darkModeColors["white"]
                          : lightModeColors["black"],
                    ),
                  ),
                  Positioned(
                    left: 100,
                    top: 22,
                    child: Text(
                      'Orders',
                      style: TextStyle(
                        color: isDarkModeEnabled
                            ? darkModeColors["white"]
                            : lightModeColors["black"],
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PostScreen()));
                },
                child: Stack(
                  children: [
                    Container(
                      width: 350,
                      height: 65,
                      decoration: BoxDecoration(
                          color: isDarkModeEnabled
                              ? darkModeColors["black"]
                              : lightModeColors["white"],
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 20,
                      child: SvgPicture.asset(
                        'assets/icons/point_of_sale_FILL0_wght400_GRAD0_opsz48.svg',
                        width: 40,
                        height: 40,
                        color: isDarkModeEnabled
                            ? darkModeColors["white"]
                            : lightModeColors["black"],
                      ),
                    ),
                    Positioned(
                      left: 100,
                      top: 22,
                      child: Text(
                        'Sales',
                        style: TextStyle(
                          color: isDarkModeEnabled
                              ? darkModeColors["white"]
                              : lightModeColors["black"],
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              InkWell(
                onTap: () {
                  _signOut(context);
                },
                child: Stack(
                  children: [
                    Container(
                      width: 350,
                      height: 65,
                      decoration: BoxDecoration(
                          color: isDarkModeEnabled
                              ? darkModeColors["black"]
                              : lightModeColors["white"],
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 20,
                      child: SvgPicture.asset(
                        'assets/icons/logout_FILL0_wght400_GRAD0_opsz48.svg',
                        width: 40,
                        height: 40,
                        color: isDarkModeEnabled
                            ? darkModeColors["white"]
                            : lightModeColors["black"],
                      ),
                    ),
                    Positioned(
                      left: 100,
                      top: 22,
                      child: Text(
                        'Logout',
                        style: TextStyle(
                          color: isDarkModeEnabled
                              ? darkModeColors["white"]
                              : lightModeColors["black"],
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // Navigate to the intro screen after successful logout
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => IntroScreen()),
      );
    } catch (e) {
      // Handle any sign-out errors here
      print('Error signing out: $e');
    }
  }
}
