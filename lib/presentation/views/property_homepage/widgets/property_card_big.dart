import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/services/app/controller/app_controller.dart';
import 'package:easyrent/core/utils/error_loading_mssg.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:easyrent/main.dart';
import 'package:easyrent/presentation/views/property_homepage/views/property_details_page.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PropertyCardBig extends StatelessWidget {
  final String imagePath;
  final String title;
  final String location;
  final int price;
  final double rating;
  const PropertyCardBig(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.location,
      required this.price,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    debug.w("${Get.find<AppController>().isOffline.value} ❤️");

    return Obx(() {
      return Skeletonizer(
        enabled: !Get.find<AppController>().isOffline.value,
        enableSwitchAnimation: true,
        containersColor: Theme.of(context).colorScheme.onTertiary,
        child: RawMaterialButton(
          onPressed: () {
            Get.to(
                transition: Transition.fadeIn,
                duration: const Duration(milliseconds: 520),
                PropertyDetailsPage(
                  title: "MODERNISM VILLA",
                  genre: "Villa",
                  ratings: 4.5,
                  reviews: 1221,
                  beds: 3,
                  baths: 4,
                  area: 2000,
                  price: 19322,
                  overview:
                      "Consequatur porro impedit alias odio voluptatem qui qui rerum aspernatur. Facere mollitia fugit perferendis deleniti quam neque voluptatem repellendus natus. Omnis ipsum culpa qui minima.",
                  previewImages: const [apartment, apartment2, japan],
                  galleryImages: const [
                    apartment3,
                    japan,
                    apartment2,
                    japan,
                    apartment,
                    japan,
                    apartment
                  ],
                  lat: 33.5138,
                  lng: 36.2765,
                  panoramaImages: const [
                    {'name': 'Living Room', 'imagePath': panorama1},
                    {'name': 'Kitchen', 'imagePath': panorama2},
                    {'name': 'Bedroom', 'imagePath': panorama3},
                  ],
                ));
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
                      // !Background Image
                      //# test
                      Image.asset(
                        imagePath,
                        height: 340.h,
                        width: 250.w,
                        fit: BoxFit.cover,
                      ),
                      // FancyShimmerImage(
                      //     height: 340.h,
                      //     width: 250.w,
                      //     boxFit: BoxFit.cover,
                      //     imageUrl: onlineImageUrl,
                      //     errorWidget: const ErrorLoadingWidget()),
                      //! Gradient Overlay
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
                              style: AppTextStyles.h20semi.copyWith(
                                color: white,
                                fontSize: 18.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              location,
                              style: AppTextStyles.h16regular.copyWith(
                                color: white,
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              '\$$price',
                              style: TextStyle(
                                color: primaryBlue,
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star_rounded, color: orange, size: 18.sp),
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
        ),
      );
    });
  }
}
