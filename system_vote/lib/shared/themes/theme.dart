import 'package:flutter/material.dart';

class SystemVoteTheme {
  static final SystemVoteTheme _instance = SystemVoteTheme._internal();

  factory SystemVoteTheme() {
    return _instance;
  }

  SystemVoteTheme._internal();

  /// Convert a hex color into number color which flutter recognize
  static Color getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");

    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }

    return Color(int.parse(hexColor, radix: 16));
  }

  Color red = Colors.red;
  Color white = getColorFromHex("#FFFFFF");
  Color primaryBlue = getColorFromHex("#2F80ED");
  // get correct secondary blue
  Color secondaryBlue = getColorFromHex("#2F80ED");
  Color primaryGreen = getColorFromHex("#118F5D");
  Color secondaryGreen = getColorFromHex("#68b92e");
  Color deepBlue = getColorFromHex("#003399");
  Color weakBlue = getColorFromHex("#EAEEF3");

  ThemeData get theme => ThemeData().copyWith(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: primaryBlue,
          secondary: primaryGreen,
          background: white,
          error: red,
          onPrimary: primaryBlue,
          onSecondary: primaryGreen,
          onBackground: white,
          onError: red,
          surface: primaryBlue,
          onSurface: primaryBlue,
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: white,
            fontSize: 16.0,
          ),
        ),
      );
}
