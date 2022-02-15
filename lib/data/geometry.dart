
import 'location.dart';
import 'viewport.dart';

class Geometry {
  final Location location;
  final ViewPort viewPort;
  Geometry({required this.location, required this.viewPort});

  factory Geometry.fromJson(Map<String, dynamic> json){
    return Geometry(
      location: Location.fromJson(json['location']),
      viewPort: ViewPort.fromJson(json['viewport'])
    );
  }
}