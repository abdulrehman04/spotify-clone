import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:spotify_clone/models/playlist_model.dart';
import 'package:spotify_clone/models/song_model.dart';
import 'package:spotify_clone/services/database.service.dart';
import 'package:spotify_clone/services/set_playlist_service.dart';
import 'package:stacked/stacked.dart';

@lazySingleton
class PlaylistViewModel extends BaseViewModel {
  DatabaseService db = DatabaseService();
  final SetPlaylistService _setPlaylist = SetPlaylistService();
  bool _fetchedSongs = false;

  bool get fetchedSongs => _fetchedSongs;
  PlaylistModel get playlist => _playlist;

  late PlaylistModel _playlist;
  init(PlaylistModel playlist) {
    _playlist = playlist;
    fetchSongs();
  }

  fetchSongs() async {
    for (var element in _playlist.songs) {
      DocumentSnapshot result = await db.fetchDocFromCollection(
        collection: "Songs",
        doc: element,
      );
      _playlist.fetchedSongs.add(SongModel.fromJson(result.data() as Map));
    }
    _fetchedSongs = true;
    notifyListeners();
  }

  setPlaylistThroughService(PlaylistModel playlist) {
    _setPlaylist.setPlaylist(playlist);
    notifyListeners();
  }
}
