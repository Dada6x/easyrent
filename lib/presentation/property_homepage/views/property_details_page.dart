import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:easyrent/presentation/property_homepage/widgets/agent_tile.dart';
import 'package:easyrent/presentation/property_homepage/widgets/comment_widget.dart';
import 'package:easyrent/presentation/property_homepage/widgets/gallery_widget.dart';
import 'package:easyrent/presentation/property_homepage/widgets/location_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:card_swiper/card_swiper.dart';

class PropertyDetailsPage extends StatelessWidget {
  final List<String> imageUrls;
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
  // faceliteis //!enums
  // location longtude latudie
  // AGENT name , image , role
  // COMMENT name , date , comment ,image

  PropertyDetailsPage(
      {super.key,
      required this.title,
      required this.genre,
      required this.ratings,
      required this.reviews,
      required this.beds,
      required this.baths,
      required this.area,
      required this.overview,
      required this.imageUrls,
      required this.price,
      required this.gallery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //! image
            Stack(
              children: [
                SizedBox(
                  height: 450.h,
                  width: double.infinity,
                  child: Swiper(
                    itemCount: imageUrls.length,
                    itemBuilder: (context, index) => Image.asset(
                      imageUrls[index],
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
                //! share
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 15, right: 15),
                  child: Row(
                    children: [
                      _circleButton(Icons.arrow_back, () {
                        Navigator.pop(context);
                      }),
                      const Spacer(),
                      _circleButton(Icons.share, () {}),
                      SizedBox(width: 12.w),
                      _circleButton(Icons.favorite_border, () {}),
                    ],
                  ),
                ),
                //!SECTION
              ],
            ),
            //!  details
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.h24semi,
                  ),
                  SizedBox(height: 8.h),
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
                      const Icon(
                        Icons.star_rounded,
                        color: Colors.orange,
                      ),
                      Text(
                        "$ratings ($reviews reviews)",
                        style: AppTextStyles.h14medium.copyWith(color: grey),
                      )
                    ],
                  ),
                  SizedBox(height: 16.h),
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
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Text(
                      "Agent",
                      style: AppTextStyles.h20semi,
                    ),
                  ),
                  //! agent Widget
                  const AgentTile(
                    agentImage: avatar,
                    agentName: "Natasya Wilodra",
                    agentRole: "Owner",
                  ),
                  //! Overview
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Text(
                      "Overview",
                      style: AppTextStyles.h20semi,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: Text(
                      overview,
                      style: AppTextStyles.h16medium.copyWith(color: grey),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
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
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            backgroundColor: lightPrimary2,
                            child:
                                Icon(Icons.star, size: 30, color: primaryBlue),
                          ),
                          const SizedBox(height: 8),
                          Text('Label $index', style: TextStyle(fontSize: 14)),
                        ],
                      );
                    }),
                  ),

                  //! GALLERY
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Text(
                      "Gallery",
                      style: AppTextStyles.h20semi,
                    ),
                  ),
                  GalleryWidget(images: gallery),

                  //! LOCATION
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Text(
                      "Location",
                      style: AppTextStyles.h20semi,
                    ),
                  ),
                  SizedBox(
                    height: 300.h,
                    child: const CurrentLocationMap(lat: 33.5138, lng: 36.2765),
                  ),
                  //! COMMENTS
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Text(
                      "Comments",
                      style: AppTextStyles.h20semi,
                    ),
                  ),
                  const CommentWidget(
                      imagePath: avatar,
                      name: ' Charolette Hanlin',
                      date: "10/8/2025",
                      comment:
                          "The apartment is very clean and modern. I really like the interior design. Looks like I'll feel at home 😍"),

                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
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
          size: 20.sp,
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
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
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
