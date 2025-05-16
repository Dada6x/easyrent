import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class AppController extends GetxController {
  //! this controller manage three things theme , language , and internet connection 
  RxBool isOnline = false.obs;
  RxBool isDarkMode = false.obs;
  bool isArabic = true;
  void changeLang(String codeLang) {
    Locale locale = Locale(codeLang);
    Get.updateLocale(locale);
  }

@override
  void onInit() {
    super.onInit();
    _monitorNetwork();
  }

 void _monitorNetwork() {
    InternetConnection().onStatusChange.listen((status) {
      isOnline.value = (status == InternetStatus.connected);
    });
  }


}

