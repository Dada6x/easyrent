import 'package:dio/dio.dart';
import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:easyrent/presentation/property_homepage/widgets/home_searchbar.dart';
import 'package:easyrent/presentation/search/widgets/property_widget_search.dart';
import 'package:easyrent/presentation/search/widgets/search_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

//! this is done with filtering so i dont know what to do , must see the restapi course to find out
class _SearchState extends State<Search> {
  final List<String> filters = [
    'All'.tr,
    'House'.tr,
    'Villa'.tr,
    'Apartments'.tr,
    'Lands'.tr,
    'Other'.tr
  ];
  int selectedIndex = 0;

  List<Map<String, dynamic>> properties = [];
  bool isLoading = true;

  // final PropertyService propertyService = PropertyService();

  @override
  void initState() {
    super.initState();
    // fetchProperties();
  }

  // Future<void> fetchProperties() async {
  //   setState(() => isLoading = true);
  //   try {
  //     final data =
  //         await propertyService.fetchProperties(filters[selectedIndex]);
  //     setState(() {
  //       properties = data;
  //       isLoading = false;
  //     });
  //   } catch (e) {
  //     print(e);
  //     setState(() => isLoading = false);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchAppbar(),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchBar, // search bar
            Padding(
              padding: EdgeInsets.all(8.0.r),
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
                          if (selectedIndex != index) {
                            setState(() => selectedIndex = index);
                            // fetchProperties();
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            Text(
              // "Found ${properties.length} Properties",
              "Found 1284 Properties",
              style: AppTextStyles.h20semi,
            ),
            SizedBox(height: 16.h),
            Expanded(
              child:
                  // ? const Center(child: CircularProgressIndicator())
                  ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  // final property = properties[index];
                  return const PropertyWidgetSearch(
                    title: 'Lucky Lake Apartments',
                    location: 'Tokyo, Japan',
                    imagePath: apartment,
                    price: 5000,
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

// class PropertyService {
//   final Dio _dio = Dio();
//   Future<List<Map<String, dynamic>>> fetchProperties(String category) async {
//     try {
//       final response = await _dio
//           .get("https://run.mocky.io/v3/27571361-d572-4a96-8507-b0fdef45091e");
//       List<Map<String, dynamic>> allProperties =
//           List<Map<String, dynamic>>.from(response.data);
//       if (category == 'All') return allProperties;
//       return allProperties
//           .where((property) =>
//               property['category'] != null &&
//               property['category'].toString().toLowerCase() ==
//                   category.toLowerCase())
//           .toList();
//     } catch (e) {
//       throw Exception('Failed to fetch properties: $e');
//     }
//   }
// }
