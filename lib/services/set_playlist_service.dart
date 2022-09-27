import 'package:spotify_clone/app/locator.dart';
import 'package:spotify_clone/models/playlist_model.dart';
import 'package:spotify_clone/view%20models/music%20player%20view%20model/music_player_view_model.dart';

class SetPlaylistService {
  MusicPlayerViewModel player = locator<MusicPlayerViewModel>();

  setPlaylist(PlaylistModel playlist) {
    player.setPlaylist(playlist);
  }
}
