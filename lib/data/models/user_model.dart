class User {
  
  final int? id;
  final String? phone;
  final String? username;
  final Location? location;
  final int? age;
  final String? userType;
  final bool? isAccountVerified;
  final int? totalVoteScore;
  final String? createdAt;
  final String? updatedAt;
  final dynamic profileImage;
  final dynamic planId;
  final bool? hasUsedTrial;
  const User(
      {required this.id,
      required this.phone,
      required this.username,
      required this.location,
      required this.age,
      required this.userType,
      required this.isAccountVerified,
      required this.totalVoteScore,
      required this.createdAt,
      required this.updatedAt,
      required this.profileImage,
      required this.planId,
      required this.hasUsedTrial});
  User copyWith(
      {int? id,
      String? phone,
      String? username,
      Location? location,
      int? age,
      String? userType,
      bool? isAccountVerified,
      int? totalVoteScore,
      String? createdAt,
      String? updatedAt,
      dynamic profileImage,
      dynamic planId,
      bool? hasUsedTrial}) {
    return User(
        id: id ?? this.id,
        phone: phone ?? this.phone,
        username: username ?? this.username,
        location: location ?? this.location,
        age: age ?? this.age,
        userType: userType ?? this.userType,
        isAccountVerified: isAccountVerified ?? this.isAccountVerified,
        totalVoteScore: totalVoteScore ?? this.totalVoteScore,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        profileImage: profileImage ?? this.profileImage,
        planId: planId ?? this.planId,
        hasUsedTrial: hasUsedTrial ?? this.hasUsedTrial);
  }


  static User fromJson(Map<String, Object?> json) {
    return User(
        id: json['id'] == null ? null : json['id'] as int,
        phone: json['phone'] == null ? null : json['phone'] as String,
        username: json['username'] == null ? null : json['username'] as String,
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, Object?>),
        age: json['age'] == null ? null : json['age'] as int,
        userType: json['userType'] == null ? null : json['userType'] as String,
        isAccountVerified: json['isAccountVerified'] == null
            ? null
            : json['isAccountVerified'] as bool,
        totalVoteScore: json['totalVoteScore'] == null
            ? null
            : json['totalVoteScore'] as int,
        createdAt:
            json['createdAt'] == null ? null : json['createdAt'] as String,
        updatedAt:
            json['updatedAt'] == null ? null : json['updatedAt'] as String,
        profileImage: json['profileImage'] as dynamic,
        planId: json['planId'] as dynamic,
        hasUsedTrial:
            json['hasUsedTrial'] == null ? null : json['hasUsedTrial'] as bool);
  }

  @override
  String toString() {
    return '''User(
                id:$id,
phone:$phone,
username:$username,
location:${location.toString()},
age:$age,
userType:$userType,
isAccountVerified:$isAccountVerified,
totalVoteScore:$totalVoteScore,
createdAt:$createdAt,
updatedAt:$updatedAt,
profileImage:$profileImage,
planId:$planId,
hasUsedTrial:$hasUsedTrial
    ) ''';
  }

  // @override
  // int get hashCode {
  //   return Object.hash(
  //       runtimeType,
  //       id,
  //       phone,
  //       username,
  //       location,
  //       age,
  //       userType,
  //       isAccountVerified,
  //       totalVoteScore,
  //       createdAt,
  //       updatedAt,
  //       profileImage,
  //       planId,
  //       hasUsedTrial,
  //       );
  // }
}

class Location {
  final String? country;
  final String? governorate;
  final String? city;
  final dynamic quarter;
  final String? street;
  final int? lat;
  final int? lon;
  const Location(
      {this.country,
      this.governorate,
      this.city,
      this.quarter,
      this.street,
      this.lat,
      this.lon});
  Location copyWith(
      {String? country,
      String? governorate,
      String? city,
      dynamic? quarter,
      String? street,
      int? lat,
      int? lon}) {
    return Location(
        country: country ?? this.country,
        governorate: governorate ?? this.governorate,
        city: city ?? this.city,
        quarter: quarter ?? this.quarter,
        street: street ?? this.street,
        lat: lat ?? this.lat,
        lon: lon ?? this.lon);
  }

  Map<String, Object?> toJson() {
    return {
      'country': country,
      'governorate': governorate,
      'city': city,
      'quarter': quarter,
      'street': street,
      'lat': lat,
      'lon': lon
    };
  }

  static Location fromJson(Map<String, Object?> json) {
    return Location(
        country: json['country'] == null ? null : json['country'] as String,
        governorate:
            json['governorate'] == null ? null : json['governorate'] as String,
        city: json['city'] == null ? null : json['city'] as String,
        quarter: json['quarter'] as dynamic,
        street: json['street'] == null ? null : json['street'] as String,
        lat: json['lat'] == null ? null : json['lat'] as int,
        lon: json['lon'] == null ? null : json['lon'] as int);
  }

  @override
  String toString() {
    return '''Location(
                country:$country,
governorate:$governorate,
city:$city,
quarter:$quarter,
street:$street,
lat:$lat,
lon:$lon
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Location &&
        other.runtimeType == runtimeType &&
        other.country == country &&
        other.governorate == governorate &&
        other.city == city &&
        other.quarter == quarter &&
        other.street == street &&
        other.lat == lat &&
        other.lon == lon;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, country, governorate, city, quarter, street, lat, lon);
  }
}
