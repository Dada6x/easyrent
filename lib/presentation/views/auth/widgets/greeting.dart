import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/constants/utils/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget greetings(String string1, String string2) {
  return Column(
    children: [
      SizedBox(height: 60.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(string1, style: AppTextStyles.h32semi),
        ],
      ),
      SizedBox(height: 10.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(string2, style: AppTextStyles.h16light.copyWith(color: grey))
        ],
      ),
    ],
  );
}
