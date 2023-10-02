// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_app2/themes/theme_colors.dart';
import 'package:go_app2/views/sellers/nav_screens2/earnings_screen.dart';
import 'package:go_app2/views/sellers/nav_screens2/edit_screen.dart';
import 'package:go_app2/views/sellers/nav_screens2/order_screen.dart';
import 'package:go_app2/views/sellers/nav_screens2/upload_screen.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  int _pageIndex = 0;

  // ignore: prefer_final_fields
  List<Widget> _pages = [
    EarningsScreen(),
    UploadScreen(),
    EditScreen(),
    OrderScreen(),
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
                icon: SvgPicture.asset(
                  'assets/icons/attach_money_FILL0_wght400_GRAD0_opsz48.svg',
                  width: 20,
                  color: _pageIndex == 0
                      ? isDarkModeEnabled
                          ? darkModeColors["purple"]
                          : lightModeColors["blue"]
                      : isDarkModeEnabled
                          ? darkModeColors["white"]
                          : lightModeColors["black"],
                ),
                label: 'EARNINGS'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/add_FILL0_wght400_GRAD0_opsz48.svg',
                  width: 20,
                  color: _pageIndex == 1
                      ? isDarkModeEnabled
                          ? darkModeColors["purple"]
                          : lightModeColors["blue"]
                      : isDarkModeEnabled
                          ? darkModeColors["white"]
                          : lightModeColors["black"],
                ),
                label: 'UPLOAD'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/edit_FILL0_wght400_GRAD0_opsz48.svg',
                  width: 20,
                  color: _pageIndex == 2
                      ? isDarkModeEnabled
                          ? darkModeColors["purple"]
                          : lightModeColors["blue"]
                      : isDarkModeEnabled
                          ? darkModeColors["white"]
                          : lightModeColors["black"],
                ),
                label: 'EDIT'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/shopping_cart_FILL0_wght400_GRAD0_opsz48.svg',
                  width: 20,
                  color: _pageIndex == 3
                      ? isDarkModeEnabled
                          ? darkModeColors["purple"]
                          : lightModeColors["blue"]
                      : isDarkModeEnabled
                          ? darkModeColors["white"]
                          : lightModeColors["black"],
                ),
                label: 'ORDER'),
          ]),
      body: _pages[_pageIndex],
    );
  }
}
