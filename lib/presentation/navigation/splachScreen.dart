import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/presentation/navigation/introduction_screen.dart';
import 'package:easyrent/presentation/views/auth/views/login.dart'; // Or your intro screen
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Get.off(
        () => const IntroductionScreen(),
        transition: Transition.circularReveal,
        duration: const Duration(seconds: 2),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(easyRent),
      ),
    );
  }
}
