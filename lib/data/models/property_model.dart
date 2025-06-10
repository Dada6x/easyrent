class PropertyModel {
  final int id;
  final int rooms;
  final int bathrooms;
  final double price;
  final double area;
  final String? firstImage;
  final Location? location;

  PropertyModel({
    required this.id,
    required this.rooms,
    required this.bathrooms,
    required this.price,
    required this.area,
    required this.firstImage,
    required this.location,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      id: json['id'],
      rooms: json['rooms'],
      bathrooms: json['bathrooms'],
      price: (json['price'] as num).toDouble(),
      area: (json['area'] as num).toDouble(),
      firstImage: json['firstImage'],
      location: json['location'] != null ? Location.fromJson(json['location']) : null,
    );
  }

  static List<PropertyModel> propertiesFromSnapshot(List snapshot) {
    return snapshot.map((e) => PropertyModel.fromJson(e)).toList();
  }

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


}
