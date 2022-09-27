import 'package:spotify_clone/models/artist_model.dart';
import 'package:spotify_clone/models/song_model.dart';

class PlaylistModel {
  String name, coverImage;
  List songs;
  List<SongModel> fetchedSongs;
  ArtistModel artist;

  PlaylistModel({
    required this.artist,
    required this.coverImage,
    required this.name,
    required this.songs,
    required this.fetchedSongs,
  });

  factory PlaylistModel.fromJson(Map json) {
    return PlaylistModel(
      artist: json['artist'],
      coverImage: json['coverImg'],
      name: json['name'],
      songs: json['songs'],
      fetchedSongs: [],
    );
  }
}
