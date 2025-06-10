import 'package:easyrent/core/constants/utils/pages/error_page.dart';
import 'package:easyrent/core/constants/utils/pages/nodata.dart';
import 'package:easyrent/data/models/favourite_model.dart';
import 'package:easyrent/data/repos/propertiesRepo.dart';
import 'package:easyrent/main.dart';
import 'package:easyrent/presentation/views/profile/view/profile_pages/favourite/widget/property_widget_card_favourite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyFavouritePage extends StatefulWidget {
  const MyFavouritePage({super.key});

  @override
  State<MyFavouritePage> createState() => _MyFavouritePageState();
}

late Future<List<FavoritePropertyModel>> _propertiesFuture;

class _MyFavouritePageState extends State<MyFavouritePage> {
  @override
  void initState() {
    super.initState();
    _propertiesFuture = PropertiesRepo.getFavoriteProperties();
  }

  // fav page list empty -> prop Repo ->getfavourite fetch ⟶ return list to the Model ⟶the list is now full we display it in the builder

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0.r),
      child: Column(
        children: [
          FutureBuilder<List<FavoritePropertyModel>>(
            future: _propertiesFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.9.h,
                  child: const Center(child: CircularProgressIndicator()),
                );
              }
              if (snapshot.hasError) {
                debug.i(snapshot.error);
                return const Center(child: ErrorPage());
              }
              if (!snapshot.hasData) {
                return const Center(child: noDataPage());
              }
              final properties = snapshot.data!;
              return Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: properties.length,
                  itemBuilder: (context, index) {
                    final property = properties[index];
                    return PropertyCardFavorite(
                      imagePath: property.property?.propertyImage ?? "",
                      city: property.property?.location?.city ?? "unKnown",
                      quarter: property.property?.location?.quarter ?? "",
                      area: property.property!.area ?? 0,
                      numberOfBaths: property.property?.bathrooms ?? 0,
                      numberOfBeds: property.property?.floorNumber ?? 0,
                      title: "Fav TItle ",
                      priorityScore: property.property?.priorityScore ?? 0,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
