import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/divider.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:easyrent/presentation/views/profile/view/profile_pages/notifications/widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        width: 300.w,
        height: double.infinity,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon:  Icon(Icons.arrow_back_ios_new,size: 20.r,)),
            centerTitle: true,
            title: Text(
              "Notifications ",
              style: AppTextStyles.h18regular.copyWith(color: primaryBlue),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(5.0.r),
            child: const Column(
              children: [
                CustomDivider(),
                NotificationWidget(),
                NotificationWidget(),
                NotificationWidget(),
                NotificationWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
