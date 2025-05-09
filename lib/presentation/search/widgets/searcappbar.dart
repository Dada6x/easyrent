import 'package:easyrent/core/utils/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar searchAppbar() {
  return AppBar(
    scrolledUnderElevation: 1.0,
    surfaceTintColor: Colors.transparent,
    forceMaterialTransparency: true,
    elevation: 0,
    centerTitle: true,
    title: Text("Search for Your Ideal Home", style: AppTextStyles.h16medium),
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
