import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PropertyFilterChips extends StatefulWidget {
  const PropertyFilterChips({super.key});

  @override
  State<PropertyFilterChips> createState() => _PropertyFilterChipsState();
}

class _PropertyFilterChipsState extends State<PropertyFilterChips> {
  final List<String> filters = [
    'All'.tr,
    'House'.tr,
    'Villa'.tr,
    'Apartments'.tr,
    'Lands'.tr,
    'Other'.tr
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      // visible: Get.find<AppController>().isOffline.value,
      child: SizedBox(
        height: 48.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: filters.length,
          itemBuilder: (context, index) {
            final isSelected = selectedIndex == index;
            return Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: ChoiceChip(
                showCheckmark: false,
                label: Text(filters[index], style: AppTextStyles.h14regular),
                selected: isSelected,
                selectedColor: primaryBlue,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    side: BorderSide(
                        color: Theme.of(context).colorScheme.outline)),
                onSelected: (_) {
                  setState(() {
                    selectedIndex = index;
                    // new Request of the vertical list view
                    // but i dont need setState by the way
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
