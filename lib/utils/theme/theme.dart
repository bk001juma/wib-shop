import 'package:flutter/material.dart';
import 'package:wibSHOP/utils/theme/custom_theme/appbar_theme.dart';
import 'package:wibSHOP/utils/theme/custom_theme/bottom_sheet_theme.dart';
import 'package:wibSHOP/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:wibSHOP/utils/theme/custom_theme/text_theme.dart';

class TMyAppTheme {
  TMyAppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: const Color.fromARGB(255, 255, 255, 255),
      scaffoldBackgroundColor: Colors.white,
      textTheme: TTextTheme.lightTheme,
      elevatedButtonTheme: TElevatedButtonTheme.lightTheme,
      bottomSheetTheme: TBottomSheetTheme.lightTheme,
      appBarTheme: TAppbarTheme.lightTheme);
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: const Color.fromARGB(255, 255, 255, 255),
      scaffoldBackgroundColor: Colors.black,
      textTheme: TTextTheme.darkTheme,
      elevatedButtonTheme: TElevatedButtonTheme.darkTheme,
      appBarTheme: TAppbarTheme.darkTheme,
      bottomSheetTheme: TBottomSheetTheme.darkTheme);
}
