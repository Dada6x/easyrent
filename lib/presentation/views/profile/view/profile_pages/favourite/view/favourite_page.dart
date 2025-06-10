import 'package:easyrent/presentation/views/profile/view/profile_pages/favourite/widget/property_card_favourite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyFavouritePage extends StatelessWidget {
  const MyFavouritePage({super.key});



  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(15.0.r),
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (ctx, index) {
              return const PropertyCardFavourite(
                title: "title",
                location: "location",
                imagePath: " ",
                area: 50.1,
                numberOfBaths: 2,
                numberOfBeds: 7,
              );
            }));
  }
}
