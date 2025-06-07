import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/data/models/property_model.dart';
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
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 20,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250.w,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 8.w,
          childAspectRatio: 0.76,
        ),
        itemBuilder: (context, index) {
          return const PropertyCardSmall(
            property: {
              //TODO add the from list index shit values
              "title": "La Grand Maison",
              "location": "Tokyo, Japan",
              "price": 12219,
              "rating": 4.8,
              "image": apartment,
            },
          );
        },
      ),
    );
  }
}
