import 'package:easyrent/core/utils/divider.dart';
import 'package:easyrent/presentation/views/profile/widgets/custome_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.r),
      child: Column(
        children: [
          customListTile('Change Password'.tr, Icons.password, () {}),
          customListTile(
            'Change Phone Number'.tr,
            Icons.numbers,
            () {},
          ),
          const CustomDivider()
        ],
      ),
    );
  }
}
