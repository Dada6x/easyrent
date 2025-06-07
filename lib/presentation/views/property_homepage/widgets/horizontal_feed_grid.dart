import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/presentation/views/property_homepage/widgets/property_card_big.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalFeedGrid extends StatelessWidget {
  final properties;
  const HorizontalFeedGrid({
    super.key,
    this.properties,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}

// [
//     { 
//         "rooms": 3,
//         "bathrooms": 1,
//         "area": 123,
//         "id": 33,
//         "favorites": [],
//         "user": {
//             "username": "mohamad_it1g2w"
//         },
//         "price": 2,
//         "location": {
//             "country": "مصر",
//             "governorate": "القاهرة",
//             "city": "القاهرة",
//             "quarter": "باب اللوق",
//             "street": "unnamed road",
//             "lat": 30.0444,
//             "lon": 31.2357
//         },
//         "state": "hidden",
//         "propertyImages": null,
//         "firstImage": "https://cdn-icons-png.flaticon.com/512/4757/4757668.png"
//     },
//     { 
//         "rooms": 2,
//         "bathrooms": 2,
//         "area": 95,
//         "id": 34,
//         "favorites": [],
//         "user": {
//             "username": "salma_dev"
//         },
//         "price": 3.5,
//         "location": {
//             "country": "مصر",
//             "governorate": "الجيزة",
//             "city": "الجيزة",
//             "quarter": "الدقي",
//             "street": "شارع التحرير",
//             "lat": 30.0333,
//             "lon": 31.2167
//         },
//         "state": "visible",
//         "propertyImages": null,
//         "firstImage": "https://cdn-icons-png.flaticon.com/512/3069/3069173.png"
//     },
//     { 
//         "rooms": 4,
//         "bathrooms": 3,
//         "area": 160,
//         "id": 35,
//         "favorites": [],
//         "user": {
//             "username": "ahmed_house"
//         },
//         "price": 5,
//         "location": {
//             "country": "مصر",
//             "governorate": "الاسكندرية",
//             "city": "الاسكندرية",
//             "quarter": "سموحة",
//             "street": "شارع فوزي معاذ",
//             "lat": 31.2156,
//             "lon": 29.9553
//         },
//         "state": "visible",
//         "propertyImages": null,
//         "firstImage": "https://cdn-icons-png.flaticon.com/512/619/619034.png"
//     }
// ]
