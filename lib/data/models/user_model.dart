class User {
  final int id;
  final String phone;
  final String username;
  final Location location;
  final int age;
  final String userType;
  final bool isAccountVerified;
  final String? profileImage; // nullable
  final int? planId; // nullable

  User({
    required this.id,
    required this.phone,
    required this.username,
    required this.location,
    required this.age,
    required this.userType,
    required this.isAccountVerified,
    this.profileImage,
    this.planId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      phone: json['phone'],
      username: json['username'],
      location: Location.fromJson(json['location']),
      age: json['age'],
      userType: json['userType'],
      isAccountVerified: json['isAccountVerified'],
      profileImage: json['profileImage'], // could be null
      planId: json['planId'], // could be null
    );
  }
}

class Location {
  final String country;
  final String governorate;
  final String city;
  final String? quarter; // nullable
  final String street;
  final double lat;
  final double lon;

  Location({
    required this.country,
    required this.governorate,
    required this.city,
    this.quarter,
    required this.street,
    required this.lat,
    required this.lon,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      country: json['country'],
      governorate: json['governorate'],
      city: json['city'],
      quarter: json['quarter'], // could be null
      street: json['street'],
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );
  }
}
