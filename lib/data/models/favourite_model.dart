import 'package:easyrent/data/models/propertyModel.dart';

class FavoritePropertyModel {
  int? favoriteId;
  PropertyModel? property;

  FavoritePropertyModel({this.favoriteId, this.property});

  FavoritePropertyModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['id'];
    property = json['property'] != null
        ? new PropertyModel.fromJson(json['property'])
        : null;
  }

  static List<FavoritePropertyModel> favoritePropertiesFromSnapshot(
      List snapshot) {
    return snapshot.map((e) => FavoritePropertyModel.fromJson(e)).toList();
  }
}
