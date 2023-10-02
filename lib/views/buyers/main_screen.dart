// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_app2/themes/theme_colors.dart';
import 'package:go_app2/views/buyers/nav_screens/account_screen.dart';
import 'package:go_app2/views/buyers/nav_screens/cart_screen.dart';
import 'package:go_app2/views/buyers/nav_screens/category_screen.dart';
import 'package:go_app2/views/buyers/nav_screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;

  // ignore: prefer_final_fields
  List<Widget> _pages = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkModeEnabled
          ? darkModeColors["black"]
          : lightModeColors["white"],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _pageIndex,
          unselectedItemColor: isDarkModeEnabled
              ? darkModeColors["white"]
              : lightModeColors["black"],
          selectedItemColor: isDarkModeEnabled
              ? darkModeColors["purple"]
              : lightModeColors["blue"],
          onTap: (value) {
            setState(() {
              _pageIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), label: 'HOME'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/category_FILL0_wght400_GRAD0_opsz48.svg',
                  width: 20,
                  color: _pageIndex == 1
                      ? isDarkModeEnabled
                          ? darkModeColors["purple"]
                          : lightModeColors["blue"]
                      : isDarkModeEnabled
                          ? darkModeColors["white"]
                          : lightModeColors["black"],
                ),
                label: 'CATEGORIES'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/shopping_cart_FILL0_wght400_GRAD0_opsz48.svg',
                  width: 20,
                  color: _pageIndex == 2
                      ? isDarkModeEnabled
                          ? darkModeColors["purple"]
                          : lightModeColors["blue"]
                      : isDarkModeEnabled
                          ? darkModeColors["white"]
                          : lightModeColors["black"],
                ),
                label: 'CART'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/person_FILL0_wght400_GRAD0_opsz48.svg',
                  width: 20,
                  color: _pageIndex == 3
                      ? isDarkModeEnabled
                          ? darkModeColors["purple"]
                          : lightModeColors["blue"]
                      : isDarkModeEnabled
                          ? darkModeColors["white"]
                          : lightModeColors["black"],
                ),
                label: 'ACCOUNT'),
          ]),
      body: _pages[_pageIndex],
    );
  }
}
