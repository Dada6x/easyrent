import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/services/app/controller/app_controller.dart';
import 'package:easyrent/core/services/app/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final AppController _AppController = Get.put(AppController());

    return Switch(
      activeColor: primaryBlue,
      value: _AppController.isDarkMode.value,
      onChanged: (value) {
        _AppController.isDarkMode.value = value;
        Get.changeTheme(_AppController.isDarkMode.value
            ? Themes().darkMode
            : Themes().lightMode);
      },
    );
  }
}
