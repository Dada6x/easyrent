import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:flutter/material.dart';

AppBar homePageAppbar() {
  return AppBar(
      scrolledUnderElevation: 1.0,
    surfaceTintColor: Colors.transparent,
    forceMaterialTransparency: true,
    elevation: 0,
    title: const Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: primaryBlue,
          backgroundImage: AssetImage(avatar),
        ),
        SizedBox(width: 12),
        Expanded(
          // Ensures the column doesn't overflow
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Good morning",
                style: TextStyle(fontSize: 14, color: grey),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "Yahea Dada",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, color: black),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        )
      ],
    ),
    actions: [
      IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
    ],
  );
}
