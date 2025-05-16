import 'package:easyrent/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorLoadingWidget extends StatelessWidget {
  const ErrorLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.error,
        color: grey,
        size: 28.sp,
      ),
    );
  }
}
