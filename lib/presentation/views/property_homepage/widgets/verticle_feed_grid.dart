import 'package:easyrent/data/models/property_model.dart';
import 'package:easyrent/presentation/views/property_homepage/widgets/filterChips.dart';
import 'package:easyrent/presentation/views/property_homepage/widgets/property_card_smoll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticalFeedGrid extends StatelessWidget {
  const VerticalFeedGrid({
    super.key,
    required this.properties,
  });
  final List<PropertyModel> properties;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PropertyFilterChips(),
        SizedBox(
          height: 10.h,
        ),
        GridView.builder(
          shrinkWrap: true,
          itemCount: properties.length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250.w,
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 8.w,
            childAspectRatio: 0.76,
          ),
          itemBuilder: (context, index) {
            final property = properties[index];
            return PropertyCardSmall(
              //TODO the small dosent take an map
              title: "House with ${property.rooms} rooms",
              location: property.location?.city ?? "Unknown",
              price: property.price,
              rating: 4.5, // Hardcoded
              image: property.firstImage ??
                  "https://cdn-icons-png.flaticon.com/512/3069/3069173.png",
            );
          },
        ),
      ],
    );
  }
}
