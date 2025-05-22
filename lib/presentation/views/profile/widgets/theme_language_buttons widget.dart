import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/services/app/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:easyrent/core/services/app/controller/app_controller.dart';

class Theme_languageRow extends StatelessWidget {
  const Theme_languageRow({super.key});

  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.find<AppController>();

    return Row(
      children: [
        RepaintBoundary(
          child: ThemeSwitcher(
            clipper: const ThemeSwitcherCircleClipper(),
            builder: (context) {
              return IconButton(
                icon: Icon(
                  color: Theme.of(context).colorScheme.primary,
                  ThemeModelInheritedNotifier.of(context).theme.brightness ==
                          Brightness.light
                      ? Icons.dark_mode
                      : Icons.light_mode,
                ),
                onPressed: () {
                  var brightness =
                      ThemeModelInheritedNotifier.of(context).theme.brightness;
                  ThemeSwitcher.of(context).changeTheme(
                    theme: brightness == Brightness.light
                        ? Themes().darkMode
                        : Themes().lightMode,
                    isReversed: brightness == Brightness.light,
                  );
                  //!
                },
              );
            },
          ),
        ),
        IconButton(
            onPressed: () {
              appController.isArabic.value = !appController.isArabic.value;
              appController.isArabic.value
                  ? appController.changeLang("en")
                  : appController.changeLang("ar");
            },
            icon: const Icon(
              Icons.translate,
              color: primaryBlue,
            ))
      ],
    );
  }
}
