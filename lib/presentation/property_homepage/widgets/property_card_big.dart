import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:easyrent/presentation/property_homepage/views/property_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PropertyCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String location;
  final int price;
  final double rating;
  const PropertyCard(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.location,
      required this.price,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        Get.to(PropertyDetailsPage(
            title: "MODERNISM VILLA",
            genre: "Villa",
            ratings: 4.5,
            reviews: 1221,
            beds: 3,
            baths: 4,
            area: 500,
            overview:
                "Consequatur porro impedit alias odio voluptatem qui qui rerum aspernatur. Facere mollitia fugit perferendis deleniti quam neque voluptatem repellendus natus. Omnis ipsum culpa qui minima.",
            imageUrls: const [apartment, apartment2, japan],
            price: 19322,
            gallery: const [
              apartment3,
              japan,
              apartment2,
              japan,
              apartment,
              japan,
              apartment
            ]));
      },
      child: Container(
        width: 250.w,
        margin: EdgeInsets.only(right: 16.w),
        child: Stack(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              clipBehavior: Clip.antiAlias,
              elevation: 1,
              child: Stack(
                children: [
                  // Background Image
                  Image.asset(
                    imagePath,
                    height: 340.h,
                    width: 250.w,
                    fit: BoxFit.cover,
                  ),
                  // Gradient Overlay
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                  // Text Info
                  Positioned(
                    left: 16.w,
                    right: 16.w,
                    bottom: 16.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTextStyles.h20bold.copyWith(
                            color: Colors.white,
                            fontSize: 18.sp,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          location,
                          style: AppTextStyles.h16regular.copyWith(
                            color: Colors.white70,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          '\$$price',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Rating Badge
            Positioned(
              top: 12.h,
              right: 12.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 16.sp),
                    SizedBox(width: 4.w),
                    Text(
                      rating.toString(),
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
