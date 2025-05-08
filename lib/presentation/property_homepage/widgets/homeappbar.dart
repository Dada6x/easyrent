import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar homePageAppbar() {
  return AppBar(
    scrolledUnderElevation: 1.0,
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
                "Good morning",
                style: AppTextStyles.h12regular,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "Yahea Dada",
                style: AppTextStyles.h16medium,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        )
      ],
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
