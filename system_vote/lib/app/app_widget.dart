import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const MaterialColor white = MaterialColor(
      0xFFFFFFFF,
      <int, Color>{
        50: Color(0xFFFFFFFF),
        100: Color(0xFFFFFFFF),
        200: Color(0xFFFFFFFF),
        300: Color(0xFFFFFFFF),
        400: Color(0xFFFFFFFF),
        500: Color(0xFFFFFFFF),
        600: Color(0xFFFFFFFF),
        700: Color(0xFFFFFFFF),
        800: Color(0xFFFFFFFF),
        900: Color(0xFFFFFFFF),
      },
    );

    return MaterialApp(
      title: 'System Vote',
      theme: ThemeData(
        primarySwatch: white,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.white)),
        ),
      ),
    ).modular();
  }
}
