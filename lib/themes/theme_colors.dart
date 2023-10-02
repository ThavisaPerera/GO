import 'package:flutter/material.dart';

const Map<String, Color> lightModeColors = {
  "black": Color.fromARGB(255, 0, 0, 0),
  "lightBG": Color.fromARGB(255, 248, 248, 248),
  "white": Color.fromARGB(255, 255, 255, 255),
  "blue": Color.fromARGB(255, 36, 76, 255),
  "purple": Color.fromRGBO(166, 32, 255, 1),
  "blue1": Color.fromARGB(170, 36, 76, 255),
  "purple1": Color.fromRGBO(166, 32, 255, 0.668),
  "grey": Color.fromARGB(255, 221, 221, 221),
};

const Map<String, Color> darkModeColors = {
  "white": Color.fromARGB(255, 255, 255, 255),
  "darkBG": Color.fromARGB(255, 18, 18, 18),
  "black": Color.fromARGB(255, 0, 0, 0),
  "blue": Color.fromARGB(255, 36, 76, 255),
  "purple": Color.fromRGBO(166, 32, 255, 1),
  "blue1": Color.fromARGB(170, 36, 76, 255),
  "purple1": Color.fromRGBO(166, 32, 255, 0.668),
  "lightBG": Color.fromARGB(255, 248, 248, 248),
};

bool isDarkModeEnabled = false;
bool isAdapBrightness = false;
