import 'package:easyrent/core/utils/textStyles.dart';
import 'package:easyrent/presentation/navigation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

AppBar searchAppbar() {
  return AppBar(
    scrolledUnderElevation: 1.0,
    surfaceTintColor: Colors.transparent,
    forceMaterialTransparency: true,
    elevation: 0,
    centerTitle: true,
    title:
        Text("Search for Your Ideal Home".tr, style: AppTextStyles.h16medium),
    actions: [
      Padding(
        padding: EdgeInsets.all(8.0.r),
        child: IconButton(
            onPressed: () {
              HomeScreenNavigator.scaffoldKey.currentState?.openEndDrawer();
            },
            icon: Icon(
              Icons.notifications,
              size: 30.r,
            )),
      )
    ],
  );
}
