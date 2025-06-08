import 'package:easyrent/core/constants/utils/error_page.dart';
import 'package:easyrent/data/models/property_model.dart';
import 'package:easyrent/data/repos/propertiesRepo.dart';
import 'package:easyrent/presentation/views/property_homepage/widgets/home_appbar.dart';
import 'package:easyrent/presentation/views/property_homepage/widgets/feed_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<List<PropertyModel>> _propertiesFuture;
  @override
  void initState() {
    super.initState();
    getProperties();
  }

  Future<void> getProperties() async {
    _propertiesFuture = PropertiesRepo.getProperties();
    setState(() {});
  }

  Future<void> _onRefresh() async {
    getProperties();
    await Future.delayed(const Duration(seconds: 1));
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
                        SizedBox(height: 12.h),
                        FutureBuilder<List<PropertyModel>>(
                          future: _propertiesFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.9.h,
                                child: const Center(
                                    child: CircularProgressIndicator()),
                              );
                            }
                            if (snapshot.hasError) {
                              return const Center(child: ErrorPage());
                            }
                            if (!snapshot.hasData ||
                                snapshot.data == null ||
                                snapshot.data!.isEmpty) {
                              return const Center(
                                  child: Text("No properties found."));
                            }
                            final properties = snapshot.data!;
                            return FeedPage(
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
