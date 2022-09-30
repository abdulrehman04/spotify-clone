import 'package:spotify_clone/models/artist_model.dart';
import 'package:spotify_clone/models/song_model.dart';

class PlaylistModel {
  String name, coverImage, id;
  List songs;
  List<SongModel> fetchedSongs;
  ArtistModel artist;

  PlaylistModel({
    required this.id,
    required this.artist,
    required this.coverImage,
    required this.name,
    required this.songs,
    required this.fetchedSongs,
  });

  factory PlaylistModel.fromJson(Map json, id) {
    return PlaylistModel(
      id: id,
      artist: json['artist'],
      coverImage: json['coverImg'],
      name: json['name'],
      songs: json['songs'],
      fetchedSongs: [],
    );
  }
}
