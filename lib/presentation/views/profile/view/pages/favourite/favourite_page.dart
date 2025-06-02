import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/presentation/views/search/widgets/property_widget_search.dart';
import 'package:flutter/material.dart';

class MyFavouritePage extends StatelessWidget {
  const MyFavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: const [
          PropertyWidgetSearch(
            title: 'Lucky Lake Apartments',
            location: 'Tokyo, Japan',
            imagePath: apartment,
            price: 5000,
            rating: 4.3,
          ),
          PropertyWidgetSearch(
            title: 'Lucky Lake Apartments',
            location: 'Tokyo, Japan',
            imagePath: apartment,
            price: 5000,
            rating: 4.3,
          ),
          PropertyWidgetSearch(
            title: 'Lucky Lake Apartments',
            location: 'Tokyo, Japan',
            imagePath: apartment,
            price: 5000,
            rating: 4.3,
          ),
          PropertyWidgetSearch(
            title: 'Lucky Lake Apartments',
            location: 'Tokyo, Japan',
            imagePath: apartment,
            price: 5000,
            rating: 4.3,
          ),
          PropertyWidgetSearch(
            title: 'Lucky Lake Apartments',
            location: 'Tokyo, Japan',
            imagePath: apartment,
            price: 5000,
            rating: 4.3,
          ),
        ],
      ),
    );
  }
}
