import 'package:easyrent/data/models/user_model.dart';

class PropertyModel {
  final int id;
  final int rooms;
  final int bathrooms;
  final int area;
  final double price;
  final String state;
  final String? firstImage;
  final List<dynamic> favorites;
  final User user;
  final Location location;
  final List<String>? propertyImages;

  PropertyModel({
    required this.id,
    required this.rooms,
    required this.bathrooms,
    required this.area,
    required this.price,
    required this.state,
    this.firstImage,
    required this.favorites,
    required this.user,
    required this.location,
    this.propertyImages,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      id: json['id'],
      rooms: json['rooms'],
      bathrooms: json['bathrooms'],
      area: json['area'],
      price: json['price'],
      state: json['state'],
      firstImage: json['firstImage'],
      favorites: List<dynamic>.from(json['favorites']),
      user: User.fromJson(json['user']),
      location: Location.fromJson(json['location']),
      propertyImages: json['propertyImages'] == null
          ? null
          : List<String>.from(json['propertyImages']),
    );
  }
  //! STATIC 
  static List<PropertyModel> propertiesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return PropertyModel.fromJson(data);
    }).toList();
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'rooms': rooms,
  //     'bathrooms': bathrooms,
  //     'area': area,
  //     'price': price,
  //     'state': state,
  //     'firstImage': firstImage,
  //     'favorites': favorites,
  //     'user': user.toJson(),
  //     'location': location.toJson(),
  //     'propertyImages': propertyImages,
  //   };
  // }
}

class Location {
  final String country;
  final String governorate;
  final String city;
  final String quarter;
  final String street;
  final double lat;
  final double lon;

  Location({
    required this.country,
    required this.governorate,
    required this.city,
    required this.quarter,
    required this.street,
    required this.lat,
    required this.lon,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      country: json['country'],
      governorate: json['governorate'],
      city: json['city'],
      quarter: json['quarter'],
      street: json['street'],
      lat: json['lat'].toDouble(),
      lon: json['lon'].toDouble(),
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'country': country,
  //     'governorate': governorate,
  //     'city': city,
  //     'quarter': quarter,
  //     'street': street,
  //     'lat': lat,
  //     'lon': lon,
  //   };
  // }
}
