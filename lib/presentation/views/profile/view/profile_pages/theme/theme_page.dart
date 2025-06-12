import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easyrent/core/app/controller/app_controller.dart';
import 'package:easyrent/core/app/theme/themes.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/constants/utils/divider.dart';
import 'package:easyrent/core/constants/utils/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themes = Themes();
    final currentTheme = ThemeModelInheritedNotifier.of(context).theme;

    return Padding(
      padding: EdgeInsets.all(8.0.r),
      child: Column(
        children: [
          _buildThemeTile(
            context,
            title: 'Light Mode',
            icon: Icons.light_mode,
            color: blue,
            theme: themes.lightMode,
            selected: currentTheme.brightness == Brightness.light,
          ),
          SizedBox(height: 10.h),
          _buildThemeTile(
            context,
            title: 'Dark Mode',
            icon: Icons.dark_mode,
            color: blue,
            theme: themes.darkMode,
            selected: currentTheme.brightness == Brightness.dark,
          ),
          SizedBox(height: 10.h),
          const CustomDivider(),
          const Text("Custoom primary Color"),
          _buildThemeTile(
            context,
            title: 'Red',
            icon: Icons.circle,
            color: red,
            theme: currentTheme.copyWith(
              colorScheme: currentTheme.colorScheme.copyWith(
                primary: red,
              ),
            ),
          ),
          _buildThemeTile(
            context,
            title: 'Green',
            icon: Icons.circle,
            color: green,
            theme: currentTheme.copyWith(
              colorScheme: currentTheme.colorScheme.copyWith(
                primary: green,
              ),
            ),
          ),
          _buildThemeTile(
            context,
            title: 'Grey',
            icon: Icons.circle,
            color: grey,
            theme: currentTheme.copyWith(
              colorScheme: currentTheme.colorScheme.copyWith(
                primary: grey,
              ),
            ),
          ),
          _buildThemeTile(
            context,
            title: 'Purple',
            icon: Icons.circle,
            color: purple,
            theme: currentTheme.copyWith(
              colorScheme: currentTheme.colorScheme.copyWith(
                primary: purple,
                secondary: purple.withOpacity(0.08),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          const CustomDivider(),
        ],
      ),
    );
  }


  Widget _buildThemeTile(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required ThemeData theme,
    bool selected = false,
  }) {
    return RepaintBoundary(
      child: ThemeSwitcher(
        builder: (context) {
          return ListTile(
            onTap: () {
              // Change the theme
              ThemeSwitcher.of(context).changeTheme(
                theme: theme,
                isReversed: false,
              );

              // Save the selected primary color using AppController
              final appController = Get.find<AppController>();
              appController.setPrimaryColor(color);
            },
            tileColor: selected
                ? Theme.of(context).colorScheme.secondary.withOpacity(0.3)
                : Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            leading: CircleAvatar(
              radius: 18.sp,
              backgroundColor: color,
              child: Icon(icon, color: Colors.white, size: 18.sp),
            ),
            title: Text(
              title.tr,
              style: AppTextStyles.h18regular,
            ),
          );
        },
      ),
    );
  }
}
