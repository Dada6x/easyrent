import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/app/controller/app_controller.dart';
import 'package:easyrent/core/constants/utils/error_loading_mssg.dart';
import 'package:easyrent/core/constants/utils/textStyles.dart';
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
  final int prioretyScore;

  const PropertyCardFavourite({
    super.key,
    required this.title,
    required this.location,
    required this.imagePath,
    required this.numberOfBeds,
    required this.numberOfBaths,
    required this.area,
    required this.prioretyScore,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Skeletonizer(
        enabled: !Get.find<AppController>().isOffline.value,
        enableSwitchAnimation: true,
        child: SizedBox(
          child: Container(
            margin: EdgeInsets.only(right: 12.w, bottom: 16.h),
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
                        imageUrl: imagePath,
                        errorWidget: const ErrorLoadingWidget(),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: AppTextStyles.h18semi),
                        SizedBox(height: 4.h),
                        Text(
                          location,
                          style: AppTextStyles.h14regular.copyWith(color: grey),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _FeaturesIcon(
                              number: numberOfBaths,
                              icon: Iconify(Ph.bathtub,
                                  color: primaryBlue, size: 20.sp),
                            ),
                            _FeaturesIcon(
                              number: numberOfBeds,
                              icon: Iconify(Ph.bed,
                                  color: primaryBlue, size: 20.sp),
                            ),
                            _FeaturesIcon(
                              number: area.toInt(),
                              icon: Iconify(Tabler.arrow_autofit_content,
                                  color: primaryBlue, size: 20.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: LikeButton(
                    isLiked: true,
                    likeCount: prioretyScore,
                    countPostion: CountPostion.bottom,
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

class _FeaturesIcon extends StatelessWidget {
  final int number;
  final Iconify icon;
  const _FeaturesIcon({required this.number, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(number.toString(), style: AppTextStyles.h14regular),
        SizedBox(width: 4.w),
        icon,
      ],
    );
  }
}
