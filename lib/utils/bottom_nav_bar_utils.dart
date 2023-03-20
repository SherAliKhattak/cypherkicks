import 'package:flutter/material.dart';

class BottomNavBarUtils {
  static Color color(
      int selectedIndex, int selected, Color color1, Color color2) {
    if (selected == selectedIndex) {
      return color1;
    } else {
      return color2;
    }
  }
}
