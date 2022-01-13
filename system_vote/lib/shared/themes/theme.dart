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
  Color black = getColorFromHex("#45454D");
  Color primaryColor = getColorFromHex("#FF4893");

  ThemeData get theme => ThemeData().copyWith(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: primaryColor,
          secondary: black,
          background: white,
          error: red,
          onPrimary: primaryColor,
          onSecondary: black,
          onBackground: white,
          onError: red,
          surface: primaryColor,
          onSurface: primaryColor,
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: white,
            fontSize: 16.0,
          ),
        ),
      );
}
