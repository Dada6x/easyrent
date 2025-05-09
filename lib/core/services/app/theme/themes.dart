import 'package:flutter/material.dart';

class Themes {
  final ThemeData lightMode = ThemeData(
    colorScheme: const ColorScheme.light(
      surface: Color(0xFFFFF3E9),
    ),
  );

  final ThemeData darkMode = ThemeData(
    colorScheme: const ColorScheme.dark(
      surface: Color(0xFFFFF3E9),
    ),
  );
}
