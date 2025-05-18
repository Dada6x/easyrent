import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: 300.w,
          height: double.infinity,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title:  Text("Notifications ",style: AppTextStyles.h18regular.copyWith(color: primaryBlue),),
            ),
          ),
        ),
      ),
    );
  }
}
