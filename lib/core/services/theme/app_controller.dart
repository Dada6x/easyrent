import 'dart:ui';
import 'package:get/get.dart';

class AppController extends GetxController {
  
  RxBool isOnline = false.obs;
  RxBool isDarkMode = false.obs;
  bool isArabic = true;
  void changeLang(String codeLang) {
    Locale locale = Locale(codeLang);
    Get.updateLocale(locale);
  }
}
