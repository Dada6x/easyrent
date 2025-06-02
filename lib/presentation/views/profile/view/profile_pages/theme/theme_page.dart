import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easyrent/core/app/theme/themes.dart';
import 'package:easyrent/core/utils/divider.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.r),
      child: Column(
        children: [
          RepaintBoundary(
            child: ThemeSwitcher(
              builder: (context) {
                return ListTile(
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      )),
                  onTap: () {
                    var brightness = ThemeModelInheritedNotifier.of(context)
                        .theme
                        .brightness;
                    ThemeSwitcher.of(context).changeTheme(
                      theme: brightness == Brightness.light
                          ? Themes().darkMode
                          : Themes().lightMode,
                      isReversed: brightness == Brightness.light,
                    );
                    //!
                  },
                  tileColor: Theme.of(context).colorScheme.secondary,
                  leading: Icon(
                    color: Theme.of(context).colorScheme.primary,
                    ThemeModelInheritedNotifier.of(context).theme.brightness ==
                            Brightness.light
                        ? Icons.dark_mode
                        : Icons.light_mode,
                  ),
                  title: Text(
                    Get.isDarkMode ? "Light Mode".tr : "Dark Mode".tr,
                    style: AppTextStyles.h18regular,
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          const CustomDivider()
        ],
      ),
    );
  }
}
