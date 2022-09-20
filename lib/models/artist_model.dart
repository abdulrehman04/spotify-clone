import 'package:spotify_clone/models/playlist_model.dart';

class ArtistModel {
  String name, image;
  List albums;

  ArtistModel({
    required this.albums,
    required this.image,
    required this.name,
  });

  factory ArtistModel.fromJson(Map json) {
    return ArtistModel(
      albums: json['albums'],
      image: json['image'],
      name: json['name'],
    );
  }
}
