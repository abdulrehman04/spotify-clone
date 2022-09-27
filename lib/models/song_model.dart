import 'package:spotify_clone/models/artist_model.dart';

class SongModel {
  String name, coverImg, url, artistName;
  String artist;

  SongModel(
      {required this.name,
      required this.coverImg,
      required this.artist,
      required this.artistName,
      required this.url});

  factory SongModel.fromJson(Map json) {
    return SongModel(
      name: json['name'],
      artistName: json['artistName'],
      coverImg: json['coverImg'],
      artist: json['artist'],
      url: json['url'],
    );
  }
}
