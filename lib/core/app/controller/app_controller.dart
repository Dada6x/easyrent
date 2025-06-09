import 'dart:async';
import 'dart:ui';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easyrent/core/app/theme/themes.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

//! this controller manage three things theme , language , and internet connection
class AppController extends GetxController {
  RxBool isDarkMode = false.obs;
  RxBool isArabic = true.obs;
  RxBool isOffline = true.obs;

  // change language
  void changeLang(String codeLang) {
    Locale locale = Locale(codeLang);
    Get.updateLocale(locale);
  }

  // check internet connection
  StreamSubscription? _internetConnectionStreamSubscription;

  void _checkInternetConnection() {
    bool isFirstCheck = true;
    _internetConnectionStreamSubscription =
        InternetConnection().onStatusChange.listen((event) {
      switch (event) {
        case InternetStatus.connected:
          isOffline.value = true;
          if (isFirstCheck == true) {
            isFirstCheck = false;
            break;
          } else {
            Get.rawSnackbar(
              message: "You're connected back",
              margin: const EdgeInsets.all(12),
              borderRadius: 8,
              backgroundColor: green,
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 2),
            );
            break;
          }
        case InternetStatus.disconnected:
          isOffline.value = false;

          if (isFirstCheck == true) {
            isFirstCheck = false;
            break;
          } else {
            Get.rawSnackbar(
              message: "No internet connection",
              margin: const EdgeInsets.all(12),
              borderRadius: 8,
              backgroundColor: red,
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 2),
            );
            break;
          }
      }
    });
  }

  void toggleTheme(BuildContext context) async {
    final themeSwitcher = ThemeSwitcher.of(context);
    final brightness = ThemeModelInheritedNotifier.of(context).theme.brightness;
    final isLight = brightness == Brightness.light;
    final newTheme = isLight ? Themes().darkMode : Themes().lightMode;
    if (userPref!.getBool('isDarkTheme') != isLight) {
      await userPref!.setBool('isDarkTheme', isLight);
    }
    isDarkMode.value = isLight;
    themeSwitcher.changeTheme(
      theme: newTheme,
      isReversed: isLight,
    );
  }

  @override
  void onInit() {
    super.onInit();
    _checkInternetConnection();
  }

  @override
  void dispose() {
    _internetConnectionStreamSubscription?.cancel();
    super.dispose();
  }
}
