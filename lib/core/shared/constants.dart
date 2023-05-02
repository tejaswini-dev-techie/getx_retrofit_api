import 'package:flutter/material.dart';

/* Color Constants */
Color get whiteColor => Colors.white;
Color get darkTextColor => const Color(0xFF747474);
Color get inputBackgroundColor => const Color(0xFFf2f5ed);
Color get scaffoldBackgroundColor => const Color(0xFFF8F8F8);
Color get yellowColor => const Color(0xFFFFC700);
Color get purpleColor => const Color(0xFF8000FF);
Color get blueColor => const Color(0xFF0A1172);

/* Font Family constants */
const String appFontFamily = "Arial";

/* App theme */
ThemeData get lightTheme => ThemeData(
      primaryColor: whiteColor,
      brightness: Brightness.light,
      cardColor: whiteColor,
      fontFamily: appFontFamily,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: darkTextColor),
    );
