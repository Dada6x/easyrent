import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/app/controller/app_controller.dart';
import 'package:easyrent/core/utils/divider.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.find<AppController>();

    return Padding(
      padding:  EdgeInsets.all(8.0.r),
      child: Column(
        children: [
          ListTile(
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                )),
            onTap: () {
              appController.isArabic.value = !appController.isArabic.value;
              appController.isArabic.value
                  ? appController.changeLang("en")
                  : appController.changeLang("ar");
            },
            tileColor: Theme.of(context).colorScheme.secondary,
            leading: const Icon(
              Icons.translate,
              color: primaryBlue,
            ),
            title: Text(
              // textAlign: TextAlign.center,
              "English".tr,
              style: AppTextStyles.h18regular,
            ),
          ),
          SizedBox(height: 10.h,),
          const CustomDivider()
        ],
      ),
    );
  }
}
