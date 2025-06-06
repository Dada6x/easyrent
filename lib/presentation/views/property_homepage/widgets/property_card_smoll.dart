import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/app/controller/app_controller.dart';
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

class PropertyCardSmall extends StatelessWidget {
  final Map<String, dynamic> property;

  const PropertyCardSmall({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
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
          child: Card(
            color: Theme.of(context).colorScheme.secondary,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(16.r)),
                      child:
                          //# test
                          // Image.asset(
                          //   property["image"],
                          //   height: 140.h,
                          //   width: double.infinity,
                          //   fit: BoxFit.cover,
                          // ),

                          FancyShimmerImage(
                        height: 140.h,
                        boxFit: BoxFit.cover,
                        imageUrl: onlineImageUrl,
                        errorWidget: const ErrorLoadingWidget(),
                      ),
                    ),
                    Positioned(
                      top: 8.h,
                      right: 8.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star_rounded, size: 12.r, color: orange),
                            SizedBox(width: 2.w),
                            Text(
                              "${property["rating"]}",
                              style: AppTextStyles.h10semi.copyWith(
                                fontSize: 10.sp,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        property["title"],
                        style: AppTextStyles.h16semi,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        property["location"],
                        style: AppTextStyles.h12regular.copyWith(color: grey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "\$${property["price"]}",
                        style:
                            AppTextStyles.h16semi.copyWith(color: primaryBlue),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
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
