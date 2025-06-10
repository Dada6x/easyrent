import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/app/controller/app_controller.dart';
import 'package:easyrent/core/constants/utils/error_loading_mssg.dart';
import 'package:easyrent/core/constants/utils/textStyles.dart';
import 'package:easyrent/presentation/views/property_homepage/views/property_details_page.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ph.dart';
import 'package:iconify_flutter_plus/icons/tabler.dart';
import 'package:like_button/like_button.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PropertyCardFavourite extends StatelessWidget {
  final String title;
  final String location;
  final String imagePath;
  final int numberOfBeds;
  final int numberOfBaths;
  final double area;

  const PropertyCardFavourite({
    super.key,
    required this.title,
    required this.location,
    required this.imagePath,
    required this.numberOfBeds,
    required this.numberOfBaths,
    required this.area,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Skeletonizer(
        enabled: !Get.find<AppController>().isOffline.value,
        enableSwitchAnimation: true,
        child: RawMaterialButton(
          onPressed: () {
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
                      FancyShimmerImage(
                        height: 120.h,
                        width: 120.w,
                        boxFit: BoxFit.cover,
                        imageUrl: onlineImageUrl,
                        errorWidget: const ErrorLoadingWidget(),
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
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _featuresIcon(
                              number: numberOfBaths,
                              icon: Iconify(
                                Ph.bathtub,
                                color: primaryBlue,
                                size: 25.sp,
                              ),
                            ),
                            Text(
                              "|",
                              style: AppTextStyles.h20light,
                            ),
                            _featuresIcon(
                              number: numberOfBeds,
                              icon: Iconify(
                                Ph.bed,
                                color: primaryBlue,
                                size: 25.sp,
                              ),
                            ),
                            const Text("|"),
                            _featuresIcon(
                              number: area.toInt(),
                              icon: Iconify(
                                Tabler.arrow_autofit_content,
                                color: primaryBlue,
                                size: 25.sp,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(right: 12.r),
                  child:  const Column(
                    children: [
                      LikeButton(
                        isLiked: true,
                      
                      )
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

// ignore: camel_case_types
class _featuresIcon extends StatelessWidget {
  final int number;
  final Iconify icon;
  const _featuresIcon({
    required this.number,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(number.toString()),
        SizedBox(
          width: 5.w,
        ),
        icon,
      ],
    );
  }
}
