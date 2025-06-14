import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:easyrent/core/constants/utils/pages/error_page.dart';
import 'package:easyrent/core/constants/utils/pages/nodata_page.dart';
import 'package:easyrent/presentation/views/property_homepage/controller/propertiy_controller.dart';
import 'package:easyrent/presentation/views/property_homepage/widgets/feed_page.dart';
import 'package:easyrent/presentation/views/property_homepage/widgets/home_appbar.dart';

// ignore: must_be_immutable
class Homepage extends StatelessWidget {
  Homepage({super.key});

  final PropertiesController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: controller.refreshProperties,
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
                    child: Obx(() {
                      if (controller.isLoading.value) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.8,
                          child:
                              const Center(child: CircularProgressIndicator()),
                        );
                      }
                      if (controller.hasError.value) {
                        return const ErrorPage();
                      }
                      if (controller.properties.isEmpty) {
                        return const noDataPage();
                      }
                      return FeedPage(properties: controller.properties);
                    }),
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
