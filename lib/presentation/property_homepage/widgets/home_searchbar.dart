import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final Widget searchBar = SearchBar(
  elevation: const WidgetStatePropertyAll(0),
  leading: const Icon(Icons.search),
  hintText: "Search Something",
  hintStyle: WidgetStatePropertyAll(AppTextStyles.h14regular),
  backgroundColor: WidgetStatePropertyAll(Colors.grey.shade200),
  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(6.r),
    side: const BorderSide(color: border),
  )),
  textStyle: WidgetStatePropertyAll(AppTextStyles.h16regular),
  trailing: [
    IconButton(
      icon: const Icon(Icons.airline_seat_legroom_reduced_rounded),
      onPressed: () {},
    ),
  ],
);
