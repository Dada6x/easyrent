import 'package:easyrent/data/models/agent_model.dart';
import 'package:easyrent/data/models/comment_model.dart';

class Property {
  final String title;
  //!  final List<String> previewImages;
  final int price;
  final String genre; // Later you can replace this with an enum.
  //
  final List<Map<String, String>> panoramaImages;

  final double ratings;
  final int reviews;
  //
  final int beds;
  final int baths;
  final int area;
  //
  final Agent agent;
  final String overview;
  //! faccelites
  final List<String> gallery;
  //location 
  final double latitude;
  final double longitude;
  // location description maybe :D
  //
  final List<Comment> comments;

  Property(
    this.panoramaImages, {
    required this.title,
    required this.price,
    required this.genre,
    required this.ratings,
    required this.reviews,
    required this.beds,
    required this.baths,
    required this.area,
    required this.overview,
    required this.gallery,
    required this.latitude,
    required this.longitude,
    required this.agent,
    required this.comments,
  });

  // factory Property.fromJson(Map<String, dynamic> json) {
  //   return Property(
  //     title: json['title'],
  //     price: json['price'],
  //     genre: json['genre'],
  //     ratings: json['ratings'],
  //     reviews: json['reviews'],
  //     beds: json['beds'],
  //     baths: json['baths'],
  //     area: json['area'],
  //     overview: json['overview'],
  //     gallery: List<String>.from(json['gallery']),
  //     latitude: json['latitude'],
  //     longitude: json['longitude'],
  //     agent: Agent.fromJson(json['agent']),
  //     comments:
  //         (json['comments'] as List).map((c) => Comment.fromJson(c)).toList(),
  //   );
  // }
}
