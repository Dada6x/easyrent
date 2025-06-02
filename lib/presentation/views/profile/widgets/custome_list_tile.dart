import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:easyrent/presentation/views/profile/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Widget customListTile({
  required String string,
  required IconData? leading,
  required Widget destination_widget,
}) {
  return RawMaterialButton(
    onPressed: () {
      Get.to(() => Scaffold_page(
            title: string,
            widget: destination_widget,
          ));
    },
    child: ListTile(
      leading: Icon(
        leading,
        color: primaryBlue,
        size: 29.r, //!
      ),
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
