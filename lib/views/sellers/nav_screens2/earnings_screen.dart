// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_app2/themes/theme_colors.dart';

class EarningsScreen extends StatelessWidget {
  const EarningsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkModeEnabled
          ? darkModeColors["darkBG"]
          : lightModeColors["lightBG"],
      body: Padding(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 10,
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/icons/keyboard_backspace_FILL0_wght400_GRAD0_opsz48.svg',
                  width: 30,
                  height: 30,
                ),
              ),
            ),
            Column(
              children: [
                Spacer(),
                Center(
                  child: Container(
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: const [Colors.blue, Colors.purple],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/magicpattern-svg-chart-1694795130454.svg',
                        width: 300,
                        height: 200,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Center(
                  child: Text(
                    'Total Earnings',
                    style: TextStyle(
                        color: isDarkModeEnabled
                            ? darkModeColors["white"]
                            : lightModeColors["black"],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    'LKR 0.00',
                    style: TextStyle(
                        color: isDarkModeEnabled
                            ? darkModeColors["white"]
                            : lightModeColors["black"],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 40),
                Center(
                  child: Container(
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: const [Colors.blue, Colors.purple],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/images/magicpattern-svg-chart-1694795130454.svg',
                        width: 300,
                        height: 200,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Center(
                  child: Text(
                    'Total Orders',
                    style: TextStyle(
                        color: isDarkModeEnabled
                            ? darkModeColors["white"]
                            : lightModeColors["black"],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    '0',
                    style: TextStyle(
                        color: isDarkModeEnabled
                            ? darkModeColors["white"]
                            : lightModeColors["black"],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
