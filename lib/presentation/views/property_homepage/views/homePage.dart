import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:easyrent/data/models/property_model.dart';
import 'package:easyrent/data/repos/propertiesRepo.dart';
import 'package:easyrent/presentation/views/property_homepage/widgets/filterChips.dart';
import 'package:easyrent/presentation/views/property_homepage/widgets/home_searchbar.dart';
import 'package:easyrent/presentation/views/property_homepage/widgets/home_appbar.dart';
import 'package:easyrent/presentation/views/property_homepage/widgets/horizontal_feed_grid.dart';
import 'package:easyrent/presentation/views/property_homepage/widgets/property_card_smoll.dart';
import 'package:easyrent/presentation/views/property_homepage/widgets/verticle_feed_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<List<PropertyModel>> _propertiesFuture;

  @override
  void didChangeDependencies() {
    getProperties();
    super.didChangeDependencies();
  }

  Future<void> getProperties() async {
    _propertiesFuture = PropertiesRepo.getProperties();
    setState(() {});
  }

//! refresh shit
  Future<void> _onRefresh() async {
    getProperties();
    //TODO EMIT LOADING INDICATOUR
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          //  propertiesList.isEmpty
          //     ? const Center(
          //         //TODO if for too long give an offline message , or emit offline State
          //         child: CircularProgressIndicator(),
          //       )
          // :
          GestureDetector(
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
                        //! this should take an list of properties to display it the horizontal should at least display 4 or 3
                        //! this change the vertical search Filter i dont know how to connect them Yet
                        //! maybe put them togather in the same widget but the filtering must be via state management
                        HorizontalFeedGrid(properties: _propertiesFuture),

                        SizedBox(height: 12.h),

//! VERTICAL
                        FutureBuilder<List<PropertyModel>>(
                          future: _propertiesFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.none) {
                              return const Center(
                                  child: Text("NIGGA YOURE OFFLINE "));
                            }
                            if (snapshot.hasError) {
                              return Center(
                                  child: Text("Error: ${snapshot.error}"));
                            }
                            if (!snapshot.hasData ||
                                snapshot.data == null ||
                                snapshot.data!.isEmpty) {
                              return const Center(
                                  child: Text("No properties found."));
                            }
                            final properties = snapshot.data!;
                            return VerticalFeedGrid(
                              properties: properties,
                            );
                          },
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
