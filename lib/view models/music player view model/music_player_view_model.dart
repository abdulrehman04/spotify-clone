import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify_clone/models/playlist_model.dart';
import 'package:spotify_clone/models/song_model.dart';
import 'package:stacked/stacked.dart';

@lazySingleton
class MusicPlayerViewModel extends BaseViewModel {
  late SongModel currentSong;
  late PlaylistModel currentPlaylist;
  late Function setStateFunc;

  onSongSet(Function func) {
    setStateFunc = func;
  }

  bool _songSet = false;
  bool _playlistSet = false;

  bool get songSet => _songSet;
  bool get playlistSet => _playlistSet;

  bool _playing = false;
  bool _initialised = false;
  Duration _position = Duration.zero;

  bool get playing => _playing;
  bool get initialised => _initialised;
  Duration get position => _position;
  MusicPlayerViewModel() {
    init();
  }

  init() async {
    await setUrl();
    player1.positionStream.listen((event) {
      _position = event;
      notifyListeners();
    });
    _initialised = true;
    notifyListeners();
  }

  final player1 = AudioPlayer();

  setUrl() async {
    await player1.setUrl(
      "https://p.scdn.co/mp3-preview/924d890e5b719cf0cf4cc7e1fedef0b96b23bd0d?cid=3adc8ef4c01046648691ceace3205be1",
    );
  }

  play() async {
    if (player1.playing) {
      await player1.pause();
      _playing = false;
    } else {
      player1.play();
      _playing = true;
    }
    notifyListeners();
  }

  formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [if (duration.inHours > 0) hours, minutes, seconds].join(":");
  }

  setPlaylist(PlaylistModel playlist) {
    currentPlaylist = playlist;
    _playlistSet = true;
    setSong(playlist.fetchedSongs[0]);
    notifyListeners();
  }

  setSong(SongModel song) {
    currentSong = song;
    _songSet = true;
    setStateFunc();
    notifyListeners();
  }
}
