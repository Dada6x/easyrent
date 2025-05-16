import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:easyrent/presentation/views/property_homepage/widgets/filterChips.dart';
import 'package:easyrent/presentation/views/property_homepage/widgets/home_searchbar.dart';
import 'package:easyrent/presentation/views/search/widgets/property_widget_search.dart';
import 'package:easyrent/presentation/views/search/widgets/search_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final List<String> filters = [
    'All'.tr,
    'House'.tr,
    'Villa'.tr,
    'Apartments'.tr,
    'Lands'.tr,
    'Other'.tr
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSearchBar(),
            // search bar
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 3.w),
              child: const PropertyFilterChips(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 6.h),
              child: Text(
                // "Found ${properties.length} Properties",
                "Found 1284 Properties",
                style: AppTextStyles.h20semi,
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  // final property = properties[index];
                  return const PropertyWidgetSearch(
                    title: 'Lucky Lake Apartments',
                    location: 'Tokyo, Japan',
                    imagePath: apartment,
                    price: 5000,
                    rating: 4.3,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
