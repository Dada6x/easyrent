import 'package:easyrent/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

class CurrentLocationMap extends StatelessWidget {
  final double latitude;
  final double longitude;
  const CurrentLocationMap(
      {super.key, latlng, required this.latitude, required this.longitude});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: FlutterMap(
        mapController: MapController(),
        options: MapOptions(
          initialCenter: LatLng(latitude, longitude),
          initialZoom: 14,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: const ['a', 'b', 'c'],
            userAgentPackageName: 'com.example.easyrent',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(latitude, longitude),
                width: 40.w,
                height: 40.h,
                child:
                    const Icon(Icons.location_on, color: primaryBlue, size: 40),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
