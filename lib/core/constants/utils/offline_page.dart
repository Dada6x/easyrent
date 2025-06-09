import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OfflinePage extends StatelessWidget {
  const OfflinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            Get.isDarkMode
                ? "assets/animations/dinofordarktheme.json"
                : "assets/animations/dinolightmode.json",
          ),
          //TODO make the Clouds the primary Color and fix the terrain color
          const SizedBox(
            height: 30,
          ),
          const Center(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Text(
                " You're Offline , Make Sure to be connected to internet "),
          ))
        ],
      ),
    );
  }
}
