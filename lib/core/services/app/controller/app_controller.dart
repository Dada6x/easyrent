import 'dart:async';
import 'dart:ui';
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
    _internetConnectionStreamSubscription =
        InternetConnection().onStatusChange.listen((event) {
      switch (event) {
        case InternetStatus.connected:
          isOffline.value = true;
          break;
        case InternetStatus.disconnected:
          isOffline.value = false;
          break;
      }
    });
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
