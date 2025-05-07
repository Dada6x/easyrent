import 'package:flutter/material.dart';

AppBar searchAppbar() {
  return AppBar(
      scrolledUnderElevation: 1.0,
    surfaceTintColor: Colors.transparent,
    forceMaterialTransparency: true,
    elevation: 0,
    centerTitle: true,
    leading: const BackButton(),
    title: const Text(
      "Search for Your Ideal Home",
      style: TextStyle(fontSize: 15),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
      )
    ],
  );
}
