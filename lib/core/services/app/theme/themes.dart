import 'package:easyrent/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Themes {
  final ThemeData lightMode = ThemeData(
    extensions: const [
      SkeletonizerConfigData(),
    ],
    fontFamily: "Rubik",
    colorScheme: const ColorScheme.light(
      primary: primaryBlue,
      surface: lightBackground,
      secondaryContainer: lightBorder,
    ),
  );

  final ThemeData darkMode = ThemeData(
    extensions: const [
      SkeletonizerConfigData.dark(),
    ],
    fontFamily: "Rubik",
    colorScheme: const ColorScheme.dark(
        primary: primaryBlue,
        surface: darkBackground,
        secondaryContainer: darkBackground),
  );
}
