import 'package:bounce/bounce.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:latlong2/latlong.dart';
import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/constants/utils/error_loading_mssg.dart';
import 'package:easyrent/core/constants/utils/pages/error_page.dart';
import 'package:easyrent/core/constants/utils/textStyles.dart';
import 'package:easyrent/data/models/property_model.dart';
import 'package:easyrent/main.dart';
import 'package:easyrent/presentation/views/property_homepage/controller/propertiy_controller.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  final MapController _mapController = MapController();
  bool _isSwiperVisible = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  void _goToProperty(PropertyModel property) {
    if (property.location != null) {
      _mapController.move(
          LatLng(property.location!.lat, property.location!.lon), 11);
    }
  }

  final controller = Get.find<PropertiesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      if (controller.hasError.value) {
        return const ErrorPage();
      }
      final properties = controller.properties;

      return Stack(
        children: [
          //! GestureDetector just for map
          GestureDetector(
            onPanDown: (_) {
              if (_isSwiperVisible) {
                setState(() {
                  _isSwiperVisible = false;
                });
              }
            },
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                keepAlive: false,
                maxZoom: 19,
                initialCenter: properties.isNotEmpty
                    ? LatLng(properties.first.location!.lat,
                        properties.first.location!.lon)
                    : const LatLng(30.0444, 31.2357),
                initialZoom: 13,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: const ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: properties
                      .where((p) => p.location != null)
                      .map(
                        (property) => Marker(
                          width: 30.w,
                          height: 30.h,
                          point: LatLng(
                            property.location!.lat,
                            property.location!.lon,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              _goToProperty(property);
                              setState(() {
                                _isSwiperVisible = true;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary.withOpacity(
                                    0.15), // Light translucent background
                                shape: BoxShape
                                    .circle, // or BoxShape.rectangle with borderRadius
                                border:
                                    Border.all(color: Theme.of(context).colorScheme.primary, width: 1.5),
                              ),
                              child: Icon(
                                Icons.circle,
                                size: 24.r,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),

          if (!_isSwiperVisible)
            Positioned(
              bottom: 95.h,
              right: 25.w,
              child: FloatingActionButton.small(
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: const OvalBorder(),
                child: const Icon(Icons.keyboard_arrow_up),
                onPressed: () => setState(() => _isSwiperVisible = true),
              ),
            ),
          //! Zoom buttons
          Positioned(
            top: 60.h,
            right: 15.w,
            child: Container(
              height: 140.h,
              width: 56.w,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Get.isDarkMode ? black : white,
                    ),
                    onPressed: () {
                      final currentZoom = _mapController.camera.zoom;
                      _mapController.move(
                        _mapController.camera.center,
                        currentZoom + 1,
                      );
                    },
                    iconSize: 30.r,
                    constraints: const BoxConstraints(),
                  ),
                  Divider(
                    color: Get.isDarkMode ? black : white,
                    thickness: 1,
                    indent: 10.w,
                    endIndent: 10.w,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.remove,
                      color: Get.isDarkMode ? black : white,
                    ),
                    onPressed: () {
                      final currentZoom = _mapController.camera.zoom;
                      _mapController.move(
                        _mapController.camera.center,
                        currentZoom - 1,
                      );
                    },
                    iconSize: 30.r,
                  ),
                ],
              ),
            ),
          ),

          //! FAB that moves with swiper
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            bottom: _isSwiperVisible ? 280.h : 20.h,
            right: 20.w,
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.primary,
              onPressed: () {},
              child: const Icon(
                Icons.my_location,
              ),
            ),
          ),

          //! Swiper stays responsive
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            bottom: _isSwiperVisible ? 20.h : -300.h,
            left: 0,
            right: 0,
            height: 250.h,
            child: Swiper(
              //! the Card
              onTap: (index) {
                debug.i(properties[index].id);
                //! depening on this You Can GO SEE the DETAILS BY INDEX

                // Get.to(
                //     transition: Transition.fadeIn,
                //     duration: const Duration(milliseconds: 520),
                //     const PropertyDetailsPage(
                //       title: "MODERNISM VILLA",
                //       genre: "Villa",
                //       ratings: 4.5,
                //       reviews: 1221,
                //       beds: 3,
                //       baths: 4,
                //       area: 2000,
                //       price: 19322,
                //       overview:
                //           "Consequatur porro impedit alias odio voluptatem qui qui rerum aspernatur. Facere mollitia fugit perferendis deleniti quam neque voluptatem repellendus natus. Omnis ipsum culpa qui minima.",
                //       previewImages: [apartment, apartment2, japan],
                //       galleryImages: [
                //         apartment3,
                //         japan,
                //         apartment2,
                //         japan,
                //         apartment,
                //         japan,
                //         apartment
                //       ],
                //       lat: 33.5138,
                //       lng: 36.2765,
                //       panoramaImages: [
                //         {'name': 'Living Room', 'imagePath': panorama1},
                //         {'name': 'Kitchen', 'imagePath': panorama2},
                //         {'name': 'Bedroom', 'imagePath': panorama3},
                //       ],
                //     ));
              },
              itemCount: properties.length,
              viewportFraction: 0.85,
              scale: 0.95,
              onIndexChanged: (index) {
                _goToProperty(properties[index]);
              },
              itemBuilder: (context, index) {
                final property = properties[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Bounce(
                    onTapUp: (p0) {},
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(15.r),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.r),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: FancyShimmerImage(
                                imageUrl: property.firstImage ?? apartment,
                                boxFit: BoxFit.cover,
                                errorWidget: const ErrorLoadingWidget(),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(12.w),
                                decoration: BoxDecoration(
                                  color: black.withOpacity(0.6),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('\$${property.price}/mo',
                                        style: AppTextStyles.h18bold
                                            .copyWith(color: Theme.of(context).colorScheme.primary)),
                                    Text(
                                      '${property.rooms} bds · ${property.bathrooms} ba · ${property.area} sqft',
                                      style: AppTextStyles.h14medium.copyWith(
                                        color: Colors.white70,
                                      ),
                                    ),
                                    Text(
                                        '${property.location?.city}, ${property.location?.street}',
                                        style: AppTextStyles.h12light.copyWith(
                                          color: Colors.white70,
                                        )),
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
              },
            ),
          ),
        ],
      );
    }));
  }
}
