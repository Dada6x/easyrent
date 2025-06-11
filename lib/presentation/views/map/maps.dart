import 'package:easyrent/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/data/models/property_model.dart';
import 'package:easyrent/data/repos/propertiesRepo.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late Future<List<PropertyModel>> _propertiesFuture;

  @override
  void initState() {
    super.initState();
    _propertiesFuture = PropertiesRepo.getProperties();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      body: FutureBuilder<List<PropertyModel>>(
        future: _propertiesFuture,
        builder: (context, snapshot) {
          debug.w("MAP");
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final properties = snapshot.data ?? [];

          return FlutterMap(
            mapController: MapController(),
            options: MapOptions(
              initialCenter: properties.isNotEmpty
                  ? LatLng(
                      properties.first.location!.lat,
                      properties.first.location!.lon,
                    )
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
                        width: 40.w,
                        height: 40.h,
                        point: LatLng(
                          property.location!.lat,
                          property.location!.lon,
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.shade600,
                            ),
                            child: Icon(
                              Icons.circle,
                              color: primaryBlue,
                              size: 20.r,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}
