import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:easyrent/core/utils/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: "Search Something".tr,
              hintStyle: AppTextStyles.h16medium.copyWith(color: grey),
              filled: true,
              fillColor: Theme.of(context).colorScheme.secondary,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) => const FilterBottomSheet(),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.tune),
          ),
        )
      ],
    );
  }
}

//! filter bottom sheet .
// NEED TWO CONTROLLERS
class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        top: 16.h,
        left: 16.w,
        right: 16.w,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Filters", style: AppTextStyles.h18semi),
            SizedBox(height: 16.h),
            // Property Type
            _buildDropdown(
                "Property Type", ["Apartment", "Villa", "Studio"], context),
            SizedBox(height: 12.h),
            // Price Range
            Row(
              children: [
                Expanded(child: _buildTextField("Min Price", context)),
                SizedBox(width: 10.h),
                Expanded(child: _buildTextField("Max Price", context)),
              ],
            ),
            SizedBox(height: 12.h),
            // Bedrooms & Bathrooms
            Row(
              children: [
                Expanded(
                    child: _buildDropdown(
                        "Bedrooms", ["1", "2", "3", "4+"], context)),
                SizedBox(width: 10.h),
                Expanded(
                    child: _buildDropdown(
                        "Bathrooms", ["1", "2", "3", "4+"], context)),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                    child:
                        CustomeButton(hint: "Apply Filters", function: () async{}))
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(
      String label, List<String> items, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.h14medium),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.secondary,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          items: items
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ))
              .toList(),
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget _buildTextField(String hint, BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Theme.of(context).colorScheme.secondary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
