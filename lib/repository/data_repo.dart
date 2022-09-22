import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:spotify_clone/constants.dart';
import 'package:spotify_clone/models/artist_model.dart';
import 'package:spotify_clone/models/playlist_model.dart';
import 'package:spotify_clone/services/database.service.dart';
import 'package:stacked/stacked.dart';

@lazySingleton
class DataRepo extends BaseViewModel {
  final List<PlaylistModel> _recentlyPlaylists = [];
  final List<PlaylistModel> _newReleasesPlaylists = [];
  // bool _dataFetched = false;

  get recentPlaylists => _recentlyPlaylists;
  // get dataFetched => _dataFetched;
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
      docData['artist'] = ArtistModel.fromJson(artist.data() as Map);
      PlaylistModel playlist = PlaylistModel.fromJson(docData);
      _newReleasesPlaylists.add(playlist);
    }
    return true;
  }

  Future<bool> _fetchRecentlyPlayed(List recentlyPlayed) async {
    print(recentlyPlayed);
    for (var i in recentlyPlayed) {
      DocumentSnapshot element = await DatabaseService()
          .fetchDocFromCollection(collection: "Playlists", doc: i);
      Map docData = element.data() as Map;
      DocumentSnapshot artist = await DatabaseService().fetchDocFromCollection(
        collection: "Artists",
        doc: element['artist'],
      );
      docData['artist'] = ArtistModel.fromJson(artist.data() as Map);
      PlaylistModel playlist = PlaylistModel.fromJson(docData);
      _recentlyPlaylists.add(playlist);
    }
    return true;
  }

  Future<bool> fetchUserData(recentlyPlayed) async {
    List result = await Future.wait([
      _fetchRecentlyPlayed(
        recentlyPlayed,
      ),
      _fetchNewReleases(),
    ]);
    if (result.length > 0) {
      return true;
    }
    return false;
  }
}
