import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easyrent/core/app/controller/app_controller.dart';
import 'package:easyrent/core/constants/colors.dart';

class ThemeLanguageRow extends StatelessWidget {
  const ThemeLanguageRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        ThemeToggleButton(),
        LanguageToggleButton(),
      ],
    );
  }
}

class LanguageToggleButton extends StatelessWidget {
  const LanguageToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.find<AppController>();
    return IconButton(
      onPressed: () {
        appController.isArabic.value = !appController.isArabic.value;
        appController.changeLang(appController.isArabic.value ? 'en' : 'ar');
      },
      icon: const Icon(Icons.translate, color: primaryBlue),
    );
  }
}

class ThemeToggleButton extends StatefulWidget {
  const ThemeToggleButton({super.key});

  @override
  State<ThemeToggleButton> createState() => _ThemeToggleButtonState();
}

class _ThemeToggleButtonState extends State<ThemeToggleButton> {
  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.find<AppController>();

    return RepaintBoundary(
      child: ThemeSwitcher(
        clipper: const ThemeSwitcherCircleClipper(),
        builder: (context) {
          final brightness =
              ThemeModelInheritedNotifier.of(context).theme.brightness;
          final isLight = brightness == Brightness.light;
          return IconButton(
            icon: Icon(
              isLight ? Icons.dark_mode : Icons.light_mode,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () => appController.toggleTheme(context),
          );
        },
      ),
    );
  }
}
