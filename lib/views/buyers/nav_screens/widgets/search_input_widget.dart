// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_app2/themes/theme_colors.dart';

class SearchInputWidget extends StatelessWidget {
  const SearchInputWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 324,
      height: 34,
      child: TextField(
        decoration: InputDecoration(
            fillColor: isDarkModeEnabled
                ? darkModeColors["black"]
                : lightModeColors["white"],
            filled: true,
            hintText: "search for products",
            hintStyle: TextStyle(
              fontSize: 15,
              color: isDarkModeEnabled
                  ? darkModeColors["white"]
                  : lightModeColors["black"],
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 10,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(5),
              child: SvgPicture.asset(
                'assets/icons/search_FILL0_wght400_GRAD0_opsz48.svg',
                width: 8,
                color: isDarkModeEnabled
                    ? darkModeColors["white"]
                    : lightModeColors["black"],
              ),
            )),
      ),
    );
  }
}
