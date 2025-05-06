import 'package:easyrent/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: IntroductionScreen(),
  ));
}
