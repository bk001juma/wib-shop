import 'package:flutter/material.dart';

class TColors {
  TColors._();

  //app basic colors

  static const Color primary = Colors.white;
  static const Color secondary = Colors.black;
  static const Color accent = Colors.green;

  //color gradient
  static const Gradient linerGradient = LinearGradient(
      begin: Alignment(0.0, 0.0),
      end: Alignment(0.707, -0.707),
      colors: [
        Colors.red,
        Color.fromARGB(255, 243, 117, 33),
        Color.fromARGB(255, 175, 116, 76),
      ]);

  // text color
  static const Color textPrimary = Colors.black;
  static const textSecondary = Colors.green;
  static const textWhite = Colors.white;

  //background color

  static const Color light = Colors.white;
  static const Color dark = Colors.black;
  static const Color primaryBackground = Color.fromARGB(255, 226, 200, 200);

  //background container colors

  static const Color lightContainer = Colors.white;
  static const Color darkContainer = Colors.black;

  // button colors
  static const Color buttonPrimary = Colors.blue;
  static const Color buttonSecondary = Colors.brown;
  static const Color buttonDisabled = Colors.grey;

  // border colors
  static const Color borderPrimary = Colors.white;
  static const Color borderSecondary = Color.fromARGB(255, 148, 117, 117);

  // error colors and validation
  static const Color error = Colors.red;
  static const Color success = Colors.green;
  static const Color warning = Colors.yellow;
  static const Color info = Colors.blue;

  // neutral colors
  static const Color black = Colors.black;
  static const Color darkGrey = Color.fromARGB(255, 105, 100, 100);
  static const Color grey = Colors.grey;
}
