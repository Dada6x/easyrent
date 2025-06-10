class FavoritePropertyModel {
  int? favoriteId;
  Property? property;

  FavoritePropertyModel({this.favoriteId, this.property});

  FavoritePropertyModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['id'];
    property = json['property'] != null
        ? new Property.fromJson(json['property'])
        : null;
  }

  static List<FavoritePropertyModel> favoritePropertiesFromSnapshot(
      List snapshot) {
    return snapshot.map((e) => FavoritePropertyModel.fromJson(e)).toList();
  }
}

class Property {
  int? rooms;
  int? bathrooms;
  double? area;
  bool? isFloor;
  int? floorNumber;
  bool? hasGarage;
  bool? hasGarden;
  String? propertyType;
  String? heatingType;
  String? flooringType;
  int? id;
  String? title;
  String? description;
  int? price;
  Location? location;
  bool? isForRent;
  String? state;
  String? propertyImage;
  Null propertyImages;
  Null panoramaImages;
  int? voteScore;
  int? viewCount;
  int? priorityScore;
  String? createdAt;
  String? updatedAt;

  Property(
      {this.rooms,
      this.bathrooms,
      this.area,
      this.isFloor,
      this.floorNumber,
      this.hasGarage,
      this.hasGarden,
      this.propertyType,
      this.heatingType,
      this.flooringType,
      this.id,
      this.title,
      this.description,
      this.price,
      this.location,
      this.isForRent,
      this.state,
      this.propertyImage,
      this.propertyImages,
      this.panoramaImages,
      this.voteScore,
      this.viewCount,
      this.priorityScore,
      this.createdAt,
      this.updatedAt});

  Property.fromJson(Map<String, dynamic> json) {
    rooms = json['rooms'];
    bathrooms = json['bathrooms'];
    area = json['area'] != null ? (json['area'] as num).toDouble() : null;
    isFloor = json['isFloor'];
    floorNumber = json['floorNumber'];
    hasGarage = json['hasGarage'];
    hasGarden = json['hasGarden'];
    propertyType = json['propertyType'];
    heatingType = json['heatingType'];
    flooringType = json['flooringType'];
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    isForRent = json['isForRent'];
    state = json['state'];
    propertyImage = json['propertyImage'];
    propertyImages = json['propertyImages'];
    panoramaImages = json['panoramaImages'];
    voteScore = json['voteScore'];
    viewCount = json['viewCount'];
    priorityScore = json['priorityScore'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}

class Location {
  String? country;
  String? governorate;
  String? city;
  String? quarter;
  String? street;
  double? lat;
  double? lon;

  Location(
      {this.country,
      this.governorate,
      this.city,
      this.quarter,
      this.street,
      this.lat,
      this.lon});

  Location.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    governorate = json['governorate'];
    city = json['city'];
    quarter = json['quarter'];
    street = json['street'];
    lat = json['lat'] != null ? (json['lat'] as num).toDouble() : null;
    lon = json['lon'] != null ? (json['lon'] as num).toDouble() : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['governorate'] = governorate;
    data['city'] = city;
    data['quarter'] = quarter;
    data['street'] = street;
    data['lat'] = lat;
    data['lon'] = lon;
    return data;
  }
}
