import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PropertyFilterChips extends StatefulWidget {
  const PropertyFilterChips({super.key});

  @override
  State<PropertyFilterChips> createState() => _PropertyFilterChipsState();
}

class _PropertyFilterChipsState extends State<PropertyFilterChips> {
  final List<String> filters = ['All', 'House', 'Villa', 'Apartments','Lands','Other'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              label: Text(filters[index],
                  style: AppTextStyles.h14regular.copyWith(
                    color: isSelected ? Colors.white : Colors.black,
                  )),
              selected: isSelected,
              selectedColor: primaryBlue,
              backgroundColor: lightPrimary2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  side: const BorderSide(color: border)),
              onSelected: (_) {
                //TODO
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
    );
  }
}
