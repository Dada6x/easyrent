import 'package:easyrent/core/utils/textStyles.dart';
import 'package:flutter/material.dart';

AppBar profileAppbar() {
  return AppBar(
    scrolledUnderElevation: 1.0,
    surfaceTintColor: Colors.transparent,
    forceMaterialTransparency: true,
    elevation: 0,
    title: Text(
      "Profile",
      style: AppTextStyles.h20semi,
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
      )
    ],
  );
}
