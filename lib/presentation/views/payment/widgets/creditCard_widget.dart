import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreditCardWidget extends StatelessWidget {
  const CreditCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0.r),
      child: Container(
        width: 400.w,
        height: 220.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          gradient: const RadialGradient(
            center: Alignment(-0.5, -0.8),
            radius: 1.5,
            colors: [
              Color(0xFF0066FF),
              Color.fromARGB(255, 6, 74, 210),
              Color(0xFF003399),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 1.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  chip,
                  height: 32.h,
                  width: 64.w,
                ),
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(google, height: 16.h),
                      SizedBox(width: 6.w),
                      Image.asset(googlePay, height: 30.h),
                      SizedBox(width: 6.w),
                      Image.asset(googlePay, height: 30.h),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              '**** **** **** 1234',
              style: TextStyle(
                color: white,
                fontSize: 25.sp,
                letterSpacing: 1.5,
                fontFamily: 'Courier',
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('VALID\nTHRU',
                        style: AppTextStyles.h10regular.copyWith(
                          height: 1.2,
                          color: Colors.white70,
                        )),
                    SizedBox(height: 2.h),
                    Text(
                      '01/26',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.white,
                        fontFamily: 'Courier',
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  masterCard,
                  height: 30.h,
                ),
              ],
            ),
            const Spacer(),
            Text(
              //! take the name of the Use
              'Abuzer Firdousi',
              style: AppTextStyles.h20medium.copyWith(
                fontFamily: "Courier",
                color: white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
