import 'package:easyrent/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Themes {
  final ThemeData lightMode = ThemeData(
    extensions: const [
      SkeletonizerConfigData(),
    ],
    fontFamily: "Rubik",
    colorScheme: ColorScheme.light(
        primary: primaryBlue,
        surface: Colors.grey.shade50,
        secondary: lightSecondary,
        outline: lightBorder,
        // for shimmer effect
        onTertiary: lightshimerContainer),
  );

  final ThemeData darkMode = ThemeData(
    extensions: const [
      SkeletonizerConfigData.dark(),
    ],
    fontFamily: "Rubik",
    colorScheme: const ColorScheme.dark(
        primary: primaryBlue,
        surface: darkBackground,
        secondary: darkSecondary,
        outline: darkBorder,
        // for shimmer effect
        onTertiary: shimmerContainer),
  );
}
