import 'package:flutter/material.dart';

class ColorStyle {
  static Color baseColor = const Color.fromRGBO(36, 89, 83, 1);
  static Color white = const Color.fromRGBO(240, 240, 240, 1);
  static Color green = const Color.fromRGBO(27, 156, 133, 1);
  static Color grayPurple = const Color.fromRGBO(76, 76, 109, 1);
  static Color lightGreen = const Color.fromRGBO(90, 164, 105, 1);
}

class BlueTheme {
  // static Color dark = const Color.fromRGBO(10, 77, 104, 1);
  static Color dark = const Color.fromRGBO(40, 55, 57, 1);
  static Color dark10 = const Color.fromRGBO(8, 131, 149, 1);
  static Color dark20 = const Color.fromRGBO(5, 191, 219, 1);
  static Color light = const Color.fromRGBO(0, 255, 202, 1);
}

class CustomTextStyle {
  static TextStyle titleStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: ColorStyle.white,
  );

  static TextStyle timeStyle =
      const TextStyle(fontSize: 20, color: Colors.white70);
}
