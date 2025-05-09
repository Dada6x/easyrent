import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyWidgetSearch extends StatelessWidget {
  final String title;
  final String location;
  final String imagePath;
  final int price;
  const PropertyWidgetSearch(
      {super.key,
      required this.title,
      required this.location,
      required this.imagePath,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: Stack(
              children: [
                Image.network(
                  imagePath,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 4.h,
                  left: 70.w,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star_rounded,
                          size: 14.r,
                          color: orange,
                        ),
                        SizedBox(width: 2.w),
                        Text("4.8", style: AppTextStyles.h10light),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Details
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.h18semi),
                  SizedBox(height: 4.h),
                  Text(location,
                      style: AppTextStyles.h14regular.copyWith(color: grey)),
                ],
              ),
            ),
          ),

          // Price & Favorite Icon
          Padding(
            padding: EdgeInsets.only(right: 12.r),
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  textAlign: TextAlign.end,
                  "\$$price",
                  style: AppTextStyles.h18semi.copyWith(color: primaryBlue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
