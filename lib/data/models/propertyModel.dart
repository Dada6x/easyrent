import 'location_model.dart';

class PropertyModel {
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
  List<String>? propertyImages;
  List<Map<String, String>>? panoramaImages;
  int? voteScore;
  int? viewCount;
  int? priorityScore;
  String? createdAt;
  String? updatedAt;

  PropertyModel({
    this.rooms,
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
    this.updatedAt,
  });

  PropertyModel.fromJson(Map<String, dynamic> json) {
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
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
    isForRent = json['isForRent'];
    state = json['state'];
    propertyImage = json['propertyImage'];

    // 🔧 Fix: Safely convert List<dynamic> to List<String>
    propertyImages = (json['propertyImages'] as List?)
        ?.map((e) => e.toString())
        .toList();

    // 🔧 Fix: Safely convert List<dynamic> to List<Map<String, String>>
    panoramaImages = (json['panoramaImages'] as List?)
        ?.map((e) => Map<String, String>.from(e as Map))
        .toList();

    voteScore = json['voteScore'];
    viewCount = json['viewCount'];
    priorityScore = json['priorityScore'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
