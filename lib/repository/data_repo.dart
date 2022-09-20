import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:spotify_clone/models/artist_model.dart';
import 'package:spotify_clone/models/playlist_model.dart';
import 'package:spotify_clone/services/database.service.dart';

@lazySingleton
class DataRepo {
  final List<PlaylistModel> _playlists = [];

  get playlists => _playlists;

  fetchData() async {
    List<DocumentSnapshot> data = await DatabaseService()
        .fetchDataFromCollection(collection: "Playlists");
    for (var element in data) {
      Map docData = element.data() as Map;
      DocumentSnapshot artist = await DatabaseService().fetchDocFromCollection(
        collection: "Artists",
        doc: element['artist'],
      );
      docData['artist'] = ArtistModel.fromJson(artist.data() as Map);
      PlaylistModel playlist = PlaylistModel.fromJson(docData);
      _playlists.add(playlist);
      return true;
    }
  }
}
