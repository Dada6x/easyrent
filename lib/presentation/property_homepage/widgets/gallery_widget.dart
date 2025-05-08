import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'dart:math';

class GalleryWidget extends StatelessWidget {
  final List<String> images;

  const GalleryWidget({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          images.length,
          (index) {
            double randomWidth = Random().nextInt(101) + 100.0.w;
            double randomHeight = Random().nextInt(101) + 100.0.h;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  viewImage(images[index]);
                },
                child: Card(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: randomWidth,
                      height: randomHeight,
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void viewImage(String image) {
  Get.to(() => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
        ),
        body: Center(
          child: PhotoView(
            imageProvider: AssetImage(image),
            backgroundDecoration: const BoxDecoration(
              color: Colors.black,
            ),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
          ),
        ),
      ));
}
