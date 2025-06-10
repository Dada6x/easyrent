import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/constants/utils/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OfflinePage extends StatelessWidget {
  const OfflinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 80.h,
          ),
          Lottie.asset(
            Get.isDarkMode
                ? "assets/animations/dinodark.json"
                : "assets/animations/dinoLight.json",
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: "You're ", style: AppTextStyles.h16medium),
                        TextSpan(
                            text: "Offline",
                            style: AppTextStyles.h16medium
                                .copyWith(color: red) // Make 'Offline' red
                            ),
                        TextSpan(
                            text:
                                ", Make Sure to be  connected to internet then try again .",
                            style: AppTextStyles.h16medium),
                      ],
                    ),
                  )))
        ],
      ),
    );
  }
}
