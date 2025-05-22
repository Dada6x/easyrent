import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:easyrent/presentation/views/property_homepage/widgets/filterChips.dart';
import 'package:easyrent/presentation/views/property_homepage/widgets/home_searchbar.dart';
import 'package:easyrent/presentation/views/property_homepage/widgets/home_appbar.dart';
import 'package:easyrent/presentation/views/property_homepage/widgets/property_card_smoll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//! parallax
class newHOMEPAGE extends StatefulWidget {
  const newHOMEPAGE({super.key});

  @override
  State<newHOMEPAGE> createState() => _HomepageState();
}

class _HomepageState extends State<newHOMEPAGE> {

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // backgroundColor: Colors.transparent,
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
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return ParallaxPropertyCardBig(
                          scrollController: _scrollController,
                          index: index,
                          imagePath: apartment2,
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

class ParallaxPropertyCardBig extends StatefulWidget {
  final ScrollController scrollController;
  final int index;
  final String imagePath;
  final String location;
  final double price;
  final double rating;
  final String title;

  const ParallaxPropertyCardBig({
    super.key,
    required this.scrollController,
    required this.index,
    required this.imagePath,
    required this.location,
    required this.price,
    required this.rating,
    required this.title,
  });

  @override
  State<ParallaxPropertyCardBig> createState() =>
      _ParallaxPropertyCardBigState();
}

class _ParallaxPropertyCardBigState extends State<ParallaxPropertyCardBig> {
  double scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (!mounted) return;
    setState(() {
      scrollOffset = widget.scrollController.offset;
    });
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Approximate width of the card + margin between cards
    double cardWidth = 280.w;
    double cardPosition = widget.index * cardWidth;
    double difference = scrollOffset - cardPosition;

    // Max horizontal shift for parallax effect
    double maxShift = 30;

    // Calculate horizontal shift, clamped within maxShift range
    double shift = (difference / cardWidth) * maxShift;
    shift = shift.clamp(-maxShift, maxShift);

    return Container(
      width: cardWidth,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Transform.translate(
              offset: Offset(shift, 0),
              child: Image.asset(
                widget.imagePath,
                fit: BoxFit.cover,
                width: cardWidth,
                height: 320.h,
              ),
            ),
          ),
          Positioned(
            bottom: 15.h,
            left: 15.w,
            right: 15.w,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.all(8.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,
                      style:
                          AppTextStyles.h18semi.copyWith(color: Colors.white)),
                  SizedBox(height: 4.h),
                  Text(widget.location,
                      style: AppTextStyles.h14bold
                          .copyWith(color: Colors.white70)),
                  SizedBox(height: 4.h),
                  Text("\$${widget.price.toStringAsFixed(0)}",
                      style:
                          AppTextStyles.h16bold.copyWith(color: Colors.white)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
