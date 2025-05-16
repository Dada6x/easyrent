import 'package:easyrent/core/services/app/controller/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    final AppController _AppController = Get.put(AppController());

    return TextButton(
        onPressed: () {
          _AppController.isArabic = !_AppController.isArabic;
          _AppController.isArabic
              ? _AppController.changeLang("en")
              : _AppController.changeLang("ar");
        },
        child: const Text("Change Language"));
  }
}
