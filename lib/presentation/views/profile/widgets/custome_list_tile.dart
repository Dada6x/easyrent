import 'package:bounce/bounce.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/constants/utils/textStyles.dart';
import 'package:easyrent/presentation/views/profile/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';

Widget customListTile({
  required String string,
  required Iconify? leading,
  required Widget destination_widget,
  String? subtitle
}) {
  return Bounce(
    onTapUp: (p0) {
      Get.to(() => Scaffold_page(
            title: string,
            widget: destination_widget,
          ));
    },
    child: ListTile(
    subtitle: subtitle != null ? Text(subtitle,style: AppTextStyles.h16light.copyWith(color: grey),) : null,      leading: leading,
      iconColor: grey,
      title: Text(string, style: AppTextStyles.h18medium),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 15.r, //!
      ),
    ),
  );
}

Widget customListRedTile(
  String string,
  IconData? leading,
  Function destination,
) {
  return RawMaterialButton(
    onPressed: () {
      destination();
    },
    child: ListTile(
      leading: Icon(
        leading,
        color: red,
        size: 29.r,
      ),
      title: Text(string, style: AppTextStyles.h18medium.copyWith(color: red)),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 15.r,
      ),
    ),
  );
}
