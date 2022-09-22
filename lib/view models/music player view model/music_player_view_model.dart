import 'package:just_audio/just_audio.dart';
import 'package:stacked/stacked.dart';

class MusicPlayerViewModel extends BaseViewModel {
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
        "https://streams.gaana.com/preview/audio_website_clip.mp4?streamauth=1663995508_8eedc28766842b44ec3fecadbfc6238f");
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
}
