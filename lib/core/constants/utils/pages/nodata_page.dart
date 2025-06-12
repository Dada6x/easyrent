import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/constants/utils/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class noDataPage extends StatelessWidget {
  const noDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9.h,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // So the column centers nicely
          children: [
            SvgPicture.asset(
              "assets/images/svg/undraw_hiking_9zta.svg",
              fit: BoxFit.contain,
              width: double.infinity,
              height: 220.h,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'No data',
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
