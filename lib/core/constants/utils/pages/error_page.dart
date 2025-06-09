import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/constants/utils/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9.h,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // So the column centers nicely
          children: [
            SvgPicture.asset(
              error,
              fit: BoxFit.contain,
              width: double.infinity,
              height: 220.h,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'Something went wrong. Please try again later.',
                textAlign: TextAlign.center,
                style: AppTextStyles.h16medium.copyWith(color: grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
