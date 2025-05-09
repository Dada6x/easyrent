import 'package:easyrent/core/utils/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

AppBar profileAppbar() {
  return AppBar(
    scrolledUnderElevation: 1.0,
    surfaceTintColor: Colors.transparent,
    forceMaterialTransparency: true,
    elevation: 0,
    title: Text(
      "Profile".tr,
      style: AppTextStyles.h20semi,
    ),
    actions: [
      Padding(
        padding: EdgeInsets.all(8.0.r),
        child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              size: 30.r,
            )),
      )
    ],
  );
}
