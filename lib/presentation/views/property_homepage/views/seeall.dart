import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/data/models/outer_property_model.dart';
import 'package:easyrent/presentation/views/auth/widgets/empty_search_bar.dart';
import 'package:easyrent/presentation/views/property_homepage/widgets/property_card_smoll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeeAll extends StatelessWidget {
  final List<OuterPropertyModel> propertiesList;
  const SeeAll({super.key, required this.propertiesList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: emptySearchBar(),
      body: GridView.builder(
        shrinkWrap: true,
        itemCount: propertiesList.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250.w,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 8.w,
          childAspectRatio: 0.76,
        ),
        itemBuilder: (context, index) {
          final property = propertiesList[index];
          return PropertyCardSmall(
            id: property.id!,
            title: "House with ${property.rooms} rooms",
            location: '${property.location?.city} ${property.location?.street}',
            price: property.price!,
            rating: 4.5, // Hardcoded
            image: property.firstImage!,
          );
        },
      ),
    );
  }
}
