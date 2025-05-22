import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:easyrent/presentation/navigation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

AppBar homePageAppbar() {
  return AppBar(
    scrolledUnderElevation: 0.0,
    surfaceTintColor: Colors.transparent,
    forceMaterialTransparency: true,
    elevation: 0,
    title: Row(
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundColor: primaryBlue,
          backgroundImage: const AssetImage(avatar),
        ),
        SizedBox(width: 12.r),
        Expanded(
          // Ensures the column doesn't overflow
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                getGreeting(),
                style: AppTextStyles.h12regular,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "UserName",
                style: AppTextStyles.h16medium,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        )
      ],
    ),
    actions: [
      IconButton(
          onPressed: () {
            HomeScreenNavigator.scaffoldKey.currentState?.openEndDrawer();
          },
          icon: Icon(
            Icons.notifications,
            size: 30.r,
          )),
    ],
  );
}

String getGreeting() {
  final hour = DateTime.now().hour;
  if (hour < 12) {
    return "Good Morning! 🌅".tr;
  } else if (hour < 17) {
    return "Good Afternoon! 🌞".tr;
  } else {
    return "Good Evening! 🌙".tr;
  }
}
