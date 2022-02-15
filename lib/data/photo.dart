
class Photo {
  int height;
  int width;
  List<String> htmlAttributions;
  String photoReference;

  Photo({required this.height, required this.width, required this.htmlAttributions, required this.photoReference});

  factory Photo.fromJson(Map<String, dynamic> json){
    return Photo(
      height: json['height'],
      width: json['width'],
      htmlAttributions: List<String>.from(json['html_attributions']),
      photoReference: json['photo_reference']
    );
  }
}