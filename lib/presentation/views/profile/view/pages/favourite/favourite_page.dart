import 'package:easyrent/presentation/views/property_homepage/widgets/property_card_big.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PropertyCardBig(
            imagePath: "",
            title: "title",
            location: "location",
            price: 10,
            rating: 5),
        PropertyCardBig(
            imagePath: "",
            title: "title",
            location: "location",
            price: 10,
            rating: 5),
        PropertyCardBig(
            imagePath: "",
            title: "title",
            location: "location",
            price: 10,
            rating: 5),
        PropertyCardBig(
            imagePath: "",
            title: "title",
            location: "location",
            price: 10,
            rating: 5),
        PropertyCardBig(
            imagePath: "",
            title: "title",
            location: "location",
            price: 10,
            rating: 5),
      ],
    );
  }
}
