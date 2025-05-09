import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:easyrent/data/models/agent_model.dart';
import 'package:easyrent/data/models/comment_model.dart';
import 'package:easyrent/presentation/property_homepage/widgets/agent_tile_widget.dart';
import 'package:easyrent/presentation/property_homepage/widgets/comments_section_widget.dart';
import 'package:easyrent/presentation/property_homepage/widgets/gallery_widget.dart';
import 'package:easyrent/presentation/property_homepage/widgets/location_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:like_button/like_button.dart';

class PropertyDetailsPage extends StatelessWidget {
  final List<String> previewImages;
  final String title;
  final int price;
  final String genre; //! should be enum
  final double ratings;
  final int reviews;
  final int beds;
  final int baths;
  final int area;
  final String overview;
  final List<String> gallery;
  // facilities //!enums
  // location longtude latudie double double
  final double lng;
  final double lat;
  //@ for every property agent and couple of Comments ??
  final agent = const Agent("Quinten nolds ", "Owner", avatar);
  final comment = const Comment(
    "charlottie Hanilin ",
    "Et asperiores dolorem dolor est rerum quis possimus. Quos ullam et ea nostrum eos possimus. Dolores excepturi quis enim.",
    "10/8/2025",
    avatar,
  );

  PropertyDetailsPage({
    super.key,
    required this.title,
    required this.genre,
    required this.ratings,
    required this.reviews,
    required this.beds,
    required this.baths,
    required this.area,
    required this.overview,
    required this.previewImages,
    required this.price,
    required this.gallery,
    required this.lng,
    required this.lat,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //! preview images
            Stack(
              children: [
                SizedBox(
                  height: 450.h,
                  width: double.infinity,
                  child: Swiper(
                    itemCount: previewImages.length,
                    itemBuilder: (context, index) => Image.asset(
                      previewImages[index],
                      fit: BoxFit.cover,
                    ),
                    pagination: SwiperPagination(
                      builder: ConnectedDotsPagination(
                        activeColor: primaryBlue,
                        inactiveColor: Colors.white60,
                      ),
                    ),
                    autoplay: true,
                  ),
                ),

                //! share buttons and favorite
                Padding(
                  padding: const EdgeInsets.only(
                      top: 60, left: 15, right: 15), //TODO
                  child: Row(
                    children: [
                      _circleButton(Icons.arrow_back, () {
                        Get.back();
                      }),
                      const Spacer(),
                      const LikeButton(
                          // onTap: (){
                          // },
                          // if yall wanted an counter
                          // likeCount: 5,
                          // countPostion: CountPostion.left,
                          // countBuilder: (likeCount, isLiked, text) {
                          //   return Text(
                          //     likeCount.toString(),
                          //     style:
                          //         AppTextStyles.h16regular.copyWith(color: white),
                          //   );
                          // },
                          ),                      //
                      _circleButton(Icons.share, () {}),
                      SizedBox(width: 12.w),
                    ],
                  ),
                ),
              ],
            ),
            //details
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //! property title
                  Text(
                    title,
                    style: AppTextStyles.h24semi,
                  ),
                  SizedBox(height: 8.h),
                  //! property genre and rating
                  Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: lightPrimary2,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            genre,
                            style: AppTextStyles.h10semi
                                .copyWith(color: primaryBlue),
                          )),
                      Icon(
                        Icons.star_rounded,
                        color: orange,
                        size: 25.r,
                      ),
                      Text(
                        "$ratings ($reviews reviews)",
                        style: AppTextStyles.h14medium.copyWith(color: grey),
                      )
                    ],
                  ),
                  SizedBox(height: 16.h),
                  //! beds and baths and area
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _featureIcon(Icons.safety_check, "$beds Beds"),
                      _featureIcon(Icons.bathroom, "$baths Baths"),
                      _featureIcon(Icons.aspect_ratio_rounded, "$area sqft"),
                    ],
                  ),
                  Divider(
                    color: border,
                    indent: 10.w,
                    endIndent: 10.w,
                  ),
                  //! Agent Widget
                  const _Headers(text: "Agent"),
                  AgentWidget(
                    agentImage: agent.avatar,
                    agentName: agent.name,
                    agentRole: agent.role,
                  ),
                  //! Overview 
                  const _Headers(text: "Overview"),
                  Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: Text(
                      overview,
                      style: AppTextStyles.h16medium.copyWith(color: grey),
                    ),
                  ),
                  // const _Headers(text: "Facilities"),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Text(
                      "Facilities",
                      style: AppTextStyles.h20semi,
                    ),
                  ),
                  //!Facilities 
                  GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(), // Prevent nested scroll
                    children: List.generate(8, (index) {
                      return Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: lightPrimary2,
                            child: Icon(Icons.star,
                                size: 30.r, color: primaryBlue),
                          ),
                          SizedBox(height: 8.h),
                          Text('Label $index',
                              style: const TextStyle(fontSize: 14)),
                        ],
                      );
                    }),
                  ),
                  //! GALLERY 
                  const _Headers(text: "Gallery"),
                  GalleryWidget(images: gallery),
                  const _Headers(text: "Location"),
                  //! Location 
                  Text("Grand City St. 100, New York, United States"),
                  SizedBox(
                    height: 300.h,
                    child: CurrentLocationMap(latitude: lat, longitude: lng),
                  ),
                  //! COMMENTS 
                  // const _Headers(text: "Comment"),
                  CommentSection(comments: [
                    comment,
                    comment,
                    comment,
                  ]),
                  SizedBox(
                    height: 10.h,
                  ),
                  Divider(
                    color: border,
                    indent: 10.w,
                    endIndent: 10.w,
                  ),
                  //! property Price
                  Padding(
                    //TODO
                    padding: EdgeInsets.symmetric(horizontal: 8.h),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Price",
                              style:
                                  AppTextStyles.h12medium.copyWith(color: grey),
                            ),
                            Text(
                              "\$$price",
                              style: AppTextStyles.h24extrabold
                                  .copyWith(color: primaryBlue),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 30.h,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 44.h,
                            // width: 200,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                elevation: 1,
                                backgroundColor: primaryBlue,
                              ),
                              onPressed: () {},
                              child: Text(
                                "Book Now",
                                style: AppTextStyles.h16semi
                                    .copyWith(color: white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30.h,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleButton(IconData icon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(
        icon,
        size: 28.sp,
        color: white,
      ),
    );
  }
}

class _Headers extends StatelessWidget {
  final String text;
  const _Headers({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Text(
        text,
        style: AppTextStyles.h20semi,
      ),
    );
  }
}

Widget _featureIcon(IconData icon, String label) {
  return Row(
    children: [
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: lightPrimary2,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(
          icon,
          size: 23.r,
          color: primaryBlue,
        ),
      ),
      const SizedBox(
        width: 5,
      ),
      Text(label, style: AppTextStyles.h14medium),
    ],
  );
}

class ConnectedDotsPagination extends SwiperPlugin {
  final double dotSize;
  final double activeWidth;
  final Color activeColor;
  final Color inactiveColor;

  ConnectedDotsPagination({
    this.dotSize = 8.0,
    this.activeWidth = 24.0,
    this.activeColor = primaryBlue,
    this.inactiveColor = grey,
  });

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(config.itemCount, (index) {
            final isActive = index == config.activeIndex;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              height: dotSize,
              width: isActive ? activeWidth : dotSize,
              decoration: BoxDecoration(
                color: isActive ? activeColor : inactiveColor,
                borderRadius: BorderRadius.circular(dotSize),
              ),
            );
          }),
        ),
      ),
    );
  }
}
