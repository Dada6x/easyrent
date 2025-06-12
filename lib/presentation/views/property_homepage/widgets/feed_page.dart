import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/constants/utils/textStyles.dart';
import 'package:easyrent/data/models/property_model.dart';
import 'package:easyrent/presentation/views/property_homepage/views/seeall.dart';
import 'package:easyrent/presentation/views/property_homepage/widgets/filterChips.dart';
import 'package:easyrent/presentation/views/property_homepage/widgets/home_searchbar.dart';
import 'package:easyrent/presentation/views/property_homepage/widgets/property_card_big.dart';
import 'package:easyrent/presentation/views/property_homepage/widgets/property_card_smoll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({
    super.key,
    required this.properties,
  });
  final List<PropertyModel> properties;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.r),
          child: const CustomSearchBar(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.r),
          child: Row(
            children: [
              Text(
                "Featured".tr,
                style: AppTextStyles.h24semi,
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Get.to(() => SeeAll(
                        propertiesList: properties,
                      ));
                },
                child: Text(
                  "See All".tr,
                  style: AppTextStyles.h16semi.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        SizedBox(
          height: 320.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              final property = properties[index];

              return PropertyCardBig(
                imagePath: property.firstImage ?? apartment,
                city: property.location?.city ?? "",
                streetName: property.location?.street ?? "",
                price: property.price,
                rating: 4.5,

                //! need to remove it
                title: "Moderincia",
              );
            },
          ),
        ),
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
              title: "House with ${property.rooms} rooms",
              location:
                  '${property.location?.city} ${property.location?.street}',
              price: property.price,
              rating: 4.5, // Hardcoded
              image: property.firstImage ?? apartment2,
            );
          },
        ),
      ],
    );
  }
}
