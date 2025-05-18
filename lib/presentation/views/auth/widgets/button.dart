import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomeButton extends StatelessWidget {
  final String hint;
  final Function function;
  final double? width;
  final double? borderRadius; // new optional radius parameter

  const CustomeButton({
    super.key,
    required this.hint,
    required this.function,
    this.width,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
      child: SizedBox(
        width: width ?? double.infinity,
        height: 52.h,
        child: ElevatedButton(
          onPressed: () {
            function();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
            ),
          ),
          child:
              Text(hint, style: AppTextStyles.h18semi.copyWith(color: white)),
        ),
      ),
    );
  }
}
