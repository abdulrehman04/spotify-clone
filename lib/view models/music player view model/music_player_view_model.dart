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
  bool isFullScreen = false;
  int _currentSongIndex = 0;

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

  final player1 = AudioPlayer();

  MusicPlayerViewModel() {
    init();
  }

  init() async {
    player1.positionStream.listen((event) {
      _position = event;
      notifyListeners();
      checkCompleted(event.inSeconds.toDouble());
    });
    notifyListeners();
  }

  updateFullScreen(bool val) {
    isFullScreen = val;
    notifyListeners();
  }

  checkCompleted(position) {
    if (player1.duration != null &&
        player1.duration!.inSeconds.toDouble() <= position) {
      nextSong();
    }
  }

  setUrl() async {
    await player1.setUrl(
      "https://p.scdn.co/mp3-preview/924d890e5b719cf0cf4cc7e1fedef0b96b23bd0d?cid=3adc8ef4c01046648691ceace3205be1",
    );
  }

  setPlaylistToPlayer({initIndex = 0}) async {
    final playlist = ConcatenatingAudioSource(
      useLazyPreparation: true,
      shuffleOrder: DefaultShuffleOrder(),
      children: currentPlaylist.fetchedSongs.map((e) {
        return AudioSource.uri(Uri.parse(e.url));
      }).toList(),
    );

    await player1.setAudioSource(
      playlist,
      initialIndex: initIndex,
      initialPosition: Duration.zero,
    );
    _initialised = true;
    play();
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
    setPlaylistToPlayer();
    notifyListeners();
  }

  setPlaylistAndSong(PlaylistModel playlist, int song) {
    currentPlaylist = playlist;
    _playlistSet = true;
    _currentSongIndex = song;
    setSong(currentPlaylist.fetchedSongs[song]);
    setPlaylistToPlayer(initIndex: song);
    notifyListeners();
  }

  setSong(SongModel song) {
    currentSong = song;
    _songSet = true;
    notifyListeners();
  }

  // Play Functions

  togglePlay() async {
    if (player1.playing) {
      await pause();
    } else {
      await play();
    }
    notifyListeners();
  }

  pause() async {
    await player1.pause();
    _playing = false;
  }

  play() {
    player1.play();
    _playing = true;
  }

  nextSong() async {
    _initialised = false;
    await player1.seekToNext();
    setSong(
      currentPlaylist.fetchedSongs[_currentSongIndex = _currentSongIndex + 1],
    );
    _initialised = true;
  }

  prevSong() async {
    _initialised = false;
    await player1.seekToPrevious();
    setSong(
      currentPlaylist.fetchedSongs[_currentSongIndex = _currentSongIndex - 1],
    );
    _initialised = true;
  }
}
