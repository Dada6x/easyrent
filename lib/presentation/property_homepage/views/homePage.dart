import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:easyrent/presentation/property_homepage/widgets/filterChips.dart';
import 'package:easyrent/presentation/property_homepage/widgets/home_searchbar.dart';
import 'package:easyrent/presentation/property_homepage/widgets/homeappbar.dart';
import 'package:easyrent/presentation/property_homepage/widgets/property_card_big.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: homePageAppbar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.r),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.r),
                child: searchBar,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.r),
                child: Row(
                  children: [
                    Text(
                      "Featured",
                      style: AppTextStyles.h24semi,
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See All",
                        style:
                            AppTextStyles.h16semi.copyWith(color: primaryBlue),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              //! HORIZONTAL SHI
              SizedBox(
                height: 320.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return const PropertyCard(
                      imagePath: "assets/images/apartment3.png",
                      location: "New York , US",
                      price: 1920,
                      rating: 4.5,
                      title: "Moderincia",
                    );
                  },
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              //! CHIPS
              const PropertyFilterChips()
              //! VERTICAL
              // vertical listview
            ],
          ),
        ));
  }
}
