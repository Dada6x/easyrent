import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/constants/utils/textStyles.dart';
import 'package:easyrent/data/Session/app_session.dart';
import 'package:easyrent/presentation/navigation/navigator.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

AppBar homePageAppbar() {
  return AppBar(
    scrolledUnderElevation: 0.0,
    surfaceTintColor: Colors.transparent,
    forceMaterialTransparency: true,
    elevation: 0,
    title: Row(
      children: [
        Skeletonizer(
          enabled: AppSession().user == null,
          child: CircleAvatar(
            radius: 28.r,
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: AppSession().user?.profileImage != null
                  ? FancyShimmerImage(
                      boxFit: BoxFit.cover,
                      imageUrl: AppSession().user!.profileImage!,
                      // errorWidget: const Icon(Icons.error)
                    )
                  : Image.asset(
                    width: 60,
                      avatar,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
        SizedBox(width: 12.r),
        Expanded(
          // Ensures the column doesn't overflow
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                getGreeting(),
                style: AppTextStyles.h12regular,
                overflow: TextOverflow.ellipsis,
              ),
              Skeletonizer(
                enabled: false,
                containersColor: grey,
                child: Skeletonizer(
                  enabled: AppSession().user == null,
                  child: Text(
                    AppSession().user?.username ?? "Loading.......",
                    style: AppTextStyles.h16medium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ),
    actions: [
      Flexible(child: SvgPicture.asset(width: 18.w, height: 28.h, househome)),
      const SizedBox(
        width: 3,
      ),
      IconButton(
          onPressed: () {
            HomeScreenNavigator.scaffoldKey.currentState?.openEndDrawer();
          },
          icon: Icon(
            Icons.notifications,
            size: 30.r,
            color: primaryBlue,
          )),
    ],
  );
}

String getGreeting() {
  final hour = DateTime.now().hour;
  if (hour < 12) {
    return "Good Morning! 🌅".tr;
  } else if (hour < 17) {
    return "Good Afternoon! 🌞".tr;
  } else {
    return "Good Evening! 🌙".tr;
  }
}
