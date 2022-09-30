import 'package:spotify_clone/models/playlist_model.dart';

class ArtistModel {
  String name, image, id;
  List albums;

  ArtistModel({
    required this.albums,
    required this.id,
    required this.image,
    required this.name,
  });

  factory ArtistModel.fromJson(Map json, id) {
    return ArtistModel(
      id: id,
      albums: json['albums'],
      image: json['image'],
      name: json['name'],
    );
  }
}
