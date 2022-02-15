import 'geometry.dart';
import 'photo.dart';

class Result {
  final Geometry geometry;
  final String icon;

  final String name;
  final List<Photo> photos;
  final String placeId;
  final double rating;
  final String reference;
  final String scope;
  final List<String> types;
  final int userRatingsTotal;
  final String vicinity;

  Result({required this.geometry, required this.icon, required this.name, required this.placeId, required this.reference,
      required this.scope, required this.vicinity, required this.types, required this.photos,
      required this.userRatingsTotal, required this.rating});

      factory Result.fromJson(Map<String, dynamic> json){
        return Result(
          geometry: Geometry.fromJson(json['geometry']),
          icon: json['icon'],
          name: json['name'],
          photos: json['photos'] != null ? json['photos'].map<Photo>((i) => Photo.fromJson(i)).toList(): [],
          placeId: json['place_id'],
          rating: json['rating'] != null ? json['rating'].toDouble(): 0.0,
          reference: json['reference'],
          scope: json['scope'],
          types: List<String>.from(json['types']),
          userRatingsTotal: json['user_ratings_total'],
          vicinity: json['vicinity'],
        );
      }
}