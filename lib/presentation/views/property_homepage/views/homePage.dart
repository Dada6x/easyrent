import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:easyrent/presentation/views/property_homepage/widgets/filterChips.dart';
import 'package:easyrent/presentation/views/property_homepage/widgets/home_searchbar.dart';
import 'package:easyrent/presentation/views/property_homepage/widgets/home_appbar.dart';
import 'package:easyrent/presentation/views/property_homepage/widgets/property_card_smoll.dart';
import 'package:easyrent/presentation/views/property_homepage/widgets/property_card_big.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future<void> _onRefresh() async {
    // TODO: Add your refresh logic here fetch new data.
    await Future.delayed(const Duration(seconds: 1)); // Simulated delay
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: _onRefresh,
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(), // required
              slivers: [
                SliverAppBar(
                  elevation: 0,
                  pinned: false,
                  title: homePageAppbar(),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0.r),
                    child: Column(
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
                                onPressed: () {},
                                child: Text(
                                  "See All".tr,
                                  style: AppTextStyles.h16semi
                                      .copyWith(color: primaryBlue),
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
                              return const PropertyCardBig(
                                imagePath: apartment3,
                                location: "New York , US",
                                price: 1920,
                                rating: 4.5,
                                title: "Moderincia",
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 12.h),
                        const PropertyFilterChips(),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: 20,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 250.w,
                              mainAxisSpacing: 10.h,
                              crossAxisSpacing: 8.w,
                              childAspectRatio: 0.76,
                            ),
                            itemBuilder: (context, index) {
                              return const PropertyCardSmall(
                                property: {
                                  "title": "La Grand Maison",
                                  "location": "Tokyo, Japan",
                                  "price": 12219,
                                  "rating": 4.8,
                                  "image": apartment,
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
! THE OLDER WITHOUT INDICATOR 
class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}
class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              // backgroundColor: Colors.transparent,
              elevation: 0,
              pinned: false,
              title: homePageAppbar()),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.r),
              child: Column(
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
                          onPressed: () {},
                          child: Text(
                            "See All".tr,
                            style: AppTextStyles.h16semi
                                .copyWith(color: primaryBlue),
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
                        return const PropertyCardBig(
                          imagePath: apartment3,
                          location: "New York , US",
                          price: 1920,
                          rating: 4.5,
                          title: "Moderincia",
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 12.h),
                  const PropertyFilterChips(),
                  Padding(
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
                            "title": "La Grand Maison",
                            "location": "Tokyo, Japan",
                            "price": 12219,
                            "rating": 4.8,
                            "image": apartment,
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/

// @ with the refresh indicator but its state

//-------------------------------------------------------->>

/*
! old code 

import 'package\:easyrent/core/constants/assets.dart';
import 'package\:easyrent/core/constants/colors.dart';
import 'package\:easyrent/core/utils/textStyles.dart';
import 'package\:easyrent/presentation/views/property\_homepage/widgets/filterChips.dart';
import 'package\:easyrent/presentation/views/property\_homepage/widgets/home\_searchbar.dart';
import 'package\:easyrent/presentation/views/property\_homepage/widgets/home\_appbar.dart';
import 'package\:easyrent/presentation/views/property\_homepage/widgets/property\_card\_smoll.dart';
import 'package\:easyrent/presentation/views/property\_homepage/widgets/property\_card\_big.dart';
import 'package\:flutter/material.dart';
import 'package\:flutter\_screenutil/flutter\_screenutil.dart';
import 'package\:get/get.dart';

class Homepage extends StatelessWidget {
const Homepage({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
// backgroundColor: lightPrimary,
appBar: homePageAppbar(),
body: SingleChildScrollView(
child: Padding(
padding: EdgeInsets.symmetric(horizontal: 15.0.r),
child: Column(
children: \[
Padding(
padding: EdgeInsets.symmetric(vertical: 10.r),
child: const CustomSearchBar(),
),

```
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
                    onPressed: () {},
                    child: Text(
                      "See All".tr,
                      style: AppTextStyles.h16semi
                          .copyWith(color: primaryBlue),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            //! HORIZONTAL
            SizedBox(
              height: 320.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const PropertyCardBig(
                    imagePath: apartment3,
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
            const PropertyFilterChips(),
            //! VERTICAL
            SizedBox(
              child: Padding(
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
                        "title": "La Grand Maison",
                        "location": "Tokyo, Japan",
                        "price": 12219,
                        "rating": 4.8,
                        "image": apartment,
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));


}}


*/