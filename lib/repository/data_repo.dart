import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:spotify_clone/app/locator.dart';
import 'package:spotify_clone/constants.dart';
import 'package:spotify_clone/models/artist_model.dart';
import 'package:spotify_clone/models/playlist_model.dart';
import 'package:spotify_clone/models/song_model.dart';
import 'package:spotify_clone/services/database.service.dart';
import 'package:spotify_clone/services/user_auth_service.dart';
import 'package:stacked/stacked.dart';

@lazySingleton
class DataRepo extends BaseViewModel {
  UserAuthService auth = locator<UserAuthService>();

  final List<PlaylistModel> _recentlyPlaylists = [];
  final List<PlaylistModel> _likedPlaylists = [];
  final List<PlaylistModel> _newReleasesPlaylists = [];
  final List<ArtistModel> _followingArtists = [];
  final List<SongModel> _likedSongs = [];
  bool _dataFetched = false;

  List<PlaylistModel> get recentPlaylists => _recentlyPlaylists;
  List<PlaylistModel> get likedPlaylists => _likedPlaylists;
  List<ArtistModel> get followingArtists => _followingArtists;
  List<SongModel> get likedSongs => _likedSongs;
  get dataFetched {
    notifyListeners();
    return _dataFetched;
  }

  get newReleasesPlaylists => _newReleasesPlaylists;

  Future<bool> _fetchNewReleases() async {
    QuerySnapshot data = await db
        .collection("Playlists")
        .where('tags', arrayContains: 'new')
        .get();
    for (var element in data.docs) {
      Map docData = element.data() as Map;
      DocumentSnapshot artist = await DatabaseService().fetchDocFromCollection(
        collection: "Artists",
        doc: element['artist'],
      );
      docData['artist'] = ArtistModel.fromJson(artist.data() as Map, artist.id);
      PlaylistModel playlist = PlaylistModel.fromJson(docData, element.id);
      _newReleasesPlaylists.add(playlist);
    }
    return true;
  }

  Future<bool> _fetchRecentlyPlayed(List recentlyPlayed) async {
    for (var i in recentlyPlayed) {
      DocumentSnapshot element = await DatabaseService()
          .fetchDocFromCollection(collection: "Playlists", doc: i);
      Map docData = element.data() as Map;
      DocumentSnapshot artist = await DatabaseService().fetchDocFromCollection(
        collection: "Artists",
        doc: element['artist'],
      );
      docData['artist'] = ArtistModel.fromJson(artist.data() as Map, artist.id);
      PlaylistModel playlist = PlaylistModel.fromJson(docData, element.id);
      _recentlyPlaylists.add(playlist);
    }
    return true;
  }

  Future<bool> fetchUserData(recentlyPlayed) async {
    List result = await Future.wait([
      _fetchRecentlyPlayed(recentlyPlayed),
      _fetchNewReleases(),
      _fetchLikedPlaylists(auth.currentUser.likedPlaylists),
      _fetchLikedArtists(auth.currentUser.likedArtists),
      _fetchLikedSongs(auth.currentUser.likedSongs),
    ]);
    if (result.isNotEmpty) {
      _dataFetched = true;
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
  }

  Future<bool> _fetchLikedPlaylists(likedPlaylist) async {
    for (var i in likedPlaylist) {
      DocumentSnapshot element = await DatabaseService()
          .fetchDocFromCollection(collection: "Playlists", doc: i);
      Map docData = element.data() as Map;
      DocumentSnapshot artist = await DatabaseService().fetchDocFromCollection(
        collection: "Artists",
        doc: element['artist'],
      );
      docData['artist'] = ArtistModel.fromJson(artist.data() as Map, artist.id);
      PlaylistModel playlist = PlaylistModel.fromJson(docData, element.id);
      _likedPlaylists.add(playlist);
    }
    return true;
  }

  Future<bool> _fetchLikedArtists(likedArtists) async {
    for (var i in likedArtists) {
      DocumentSnapshot artist = await DatabaseService()
          .fetchDocFromCollection(collection: "Artists", doc: i);

      ArtistModel artistModel =
          ArtistModel.fromJson(artist.data() as Map, artist.id);
      _followingArtists.add(artistModel);
    }
    return true;
  }

  Future<bool> _fetchLikedSongs(likedSongs) async {
    for (var i in likedSongs) {
      DocumentSnapshot song = await DatabaseService()
          .fetchDocFromCollection(collection: "Songs", doc: i);

      SongModel songModel = SongModel.fromJson(song.data() as Map);
      _likedSongs.add(songModel);
    }
    return true;
  }
}
