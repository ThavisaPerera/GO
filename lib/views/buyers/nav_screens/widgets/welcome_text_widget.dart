// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_app2/themes/theme_colors.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Get Set, Ready',
          style: TextStyle(
            fontSize: 22,
            fontFamily: "Lobster",
            color: isDarkModeEnabled
                ? darkModeColors["white"]
                : lightModeColors["black"],
          ),
        ),
        Spacer(),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.purple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                'GO',
                style: TextStyle(
                    color: Colors.white, fontSize: 24, fontFamily: "Alfa"),
              ),
            ),
          ),
        )
      ],
    );
  }
}
