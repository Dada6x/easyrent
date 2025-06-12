import 'package:bounce/bounce.dart';
import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/app/controller/app_controller.dart';
import 'package:easyrent/core/constants/utils/error_loading_mssg.dart';
import 'package:easyrent/core/constants/utils/textStyles.dart';
import 'package:easyrent/presentation/views/property_homepage/views/property_details_page.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
// import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PropertyWidgetSearch extends StatelessWidget {
  final String title;
  final String location;
  final String imagePath;
  final double rating;
  final int price;
  const PropertyWidgetSearch(
      {super.key,
      required this.title,
      required this.location,
      required this.imagePath,
      required this.price,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Bounce(
        onTapUp: (p0) {
           SystemSound.play(SystemSoundType.click);
          Get.to(
            const PropertyDetailsPage(
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
              previewImages: [apartment, apartment2, japan],
              galleryImages: [
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
              panoramaImages: [
                {'name': 'Living Room', 'imagePath': panorama1},
                {'name': 'Kitchen', 'imagePath': panorama2},
                {'name': 'Bedroom', 'imagePath': panorama3},
              ],
            ),
          );
        },
        child: Skeletonizer(
          enabled: !Get.find<AppController>().isOffline.value,
          enableSwitchAnimation: true,
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).colorScheme.secondary,
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
                      //# test
                      FancyShimmerImage(
                        height: 120.h,
                        width: 120.w,
                        boxFit: BoxFit.cover,
                        imageUrl: "",
                        errorWidget: const ErrorLoadingWidget(),
                      ),
                      Positioned(
                        top: 4.h,
                        left: 70.w,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
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
                              Text("$rating", style: AppTextStyles.h10light),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //! Details
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: AppTextStyles.h18semi),
                        SizedBox(height: 4.h),
                        Text(location,
                            style:
                                AppTextStyles.h14regular.copyWith(color: grey)),
                      ],
                    ),
                  ),
                ),

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
                        style:
                            AppTextStyles.h18semi.copyWith(color: primaryBlue),
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
