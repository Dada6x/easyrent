import 'package:easyrent/core/constants/utils/divider.dart';
import 'package:easyrent/presentation/views/profile/view/profile_pages/theme/theme_page.dart';
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
          customListTile(
              string: 'Change Password'.tr,
              leading: Icons.password,
              destination_widget: const ThemePage()),
          customListTile(
            string: 'Change Phone Number'.tr,
            leading: Icons.numbers,
            destination_widget: const ThemePage(),
          ),
          const CustomDivider()
        ],
      ),
    );
  }
}
