// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_app2/themes/theme_colors.dart';

class IntroText extends StatelessWidget {
  const IntroText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/verified_FILL0_wght400_GRAD0_opsz48.svg',
          width: 13,
          color: isDarkModeEnabled
              ? darkModeColors["purple"]
              : lightModeColors["blue"],
        ),
        Text(
          '100% Genuine',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isDarkModeEnabled
                ? darkModeColors["purple"]
                : lightModeColors["blue"],
          ),
        ),
        Spacer(),
        SvgPicture.asset(
          'assets/icons/schedule_FILL0_wght400_GRAD0_opsz48.svg',
          width: 13,
          color: isDarkModeEnabled
              ? darkModeColors["purple"]
              : lightModeColors["blue"],
        ),
        Text(
          '14 Days Back Return',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isDarkModeEnabled
                ? darkModeColors["purple"]
                : lightModeColors["blue"],
          ),
        ),
        Spacer(),
        SvgPicture.asset(
          'assets/icons/accessible_FILL0_wght400_GRAD0_opsz48.svg',
          width: 13,
          color: isDarkModeEnabled
              ? darkModeColors["purple"]
              : lightModeColors["blue"],
        ),
        Text(
          '100% Trusted',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isDarkModeEnabled
                ? darkModeColors["purple"]
                : lightModeColors["blue"],
          ),
        ),
      ],
    );
  }
}
