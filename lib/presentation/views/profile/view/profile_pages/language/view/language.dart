import 'package:easyrent/core/constants/utils/divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.r),
      child: Column(
        children: [
          ListTile(
            leading: Text(
              "🇺🇸",
              style: TextStyle(fontSize: 25.sp),
            ),
            onTap: () {
              Get.updateLocale(const Locale('en'));
            },
            title: Text('English'.tr),
          ),

          ListTile(
            leading: Text(
              "🇸🇦",
              style: TextStyle(fontSize: 25.sp),
            ),
            onTap: () {
              Get.updateLocale(const Locale('ar'));
            },
            title: Text('Arabic'.tr),
          ),

          ListTile(
            leading: Text(
              "🇫🇷",
              style: TextStyle(fontSize: 25.sp),
            ),
            onTap: () {
              Get.updateLocale(const Locale('fr'));
            },
            title: Text('French'.tr),
          ),
          //!
          ListTile(
            leading: Text(
              "🇪🇸",
              style: TextStyle(fontSize: 25.sp),
            ),
            onTap: () {
              Get.updateLocale(const Locale('es'));
            },
            title: Text('Spanish'.tr),
          ),
          //!
          ListTile(
            leading: Text(
              "🇯🇵",
              style: TextStyle(fontSize: 25.sp),
            ),
            onTap: () {
              Get.updateLocale(const Locale('ja'));
            },
            title: Text('Japanese'.tr),
          ),

          ListTile(
            leading: Text(
              "🇷🇺",
              style: TextStyle(fontSize: 25.sp),
            ),
            onTap: () {
              Get.updateLocale(const Locale('ru'));
            },
            title: Text('Russian'.tr),
          ),
          ListTile(
            leading: Text(
              "🇹🇷",
              style: TextStyle(fontSize: 25.sp),
            ),
            onTap: () {
              Get.updateLocale(const Locale('de'));
            },
            title: Text('Turkish'.tr),
          ),
          ListTile(
            leading: Text(
              "🇩🇪",
              style: TextStyle(fontSize: 25.sp),
            ),
            onTap: () {
              Get.updateLocale(const Locale('tr'));
            },
            title: Text('German'.tr),
          ),
          SizedBox(height: 10.h),

          const CustomDivider(),
        ],
      ),
    );
  }
}
