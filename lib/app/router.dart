import 'package:flutter/material.dart';
import 'package:spotify_clone/models/playlist_model.dart';
import 'package:spotify_clone/ui/views/auth/login.dart';
import 'package:spotify_clone/ui/views/bottom_navigation/bottom_navigation.dart';
import 'package:spotify_clone/ui/views/home/home_view.dart';
import 'package:spotify_clone/ui/views/music%20player/music_player.dart';
import 'package:spotify_clone/ui/views/playlist/playlist.dart';
import 'package:spotify_clone/ui/views/search/search.dart';
import 'package:spotify_clone/ui/views/splash/splash.dart';

class RouteGen {
  static Route<dynamic> onGenRoute(RouteSettings settings) {
    final arg = settings.arguments;
    bool fullScreen = false;
    // Map args = {};
    // if (arg != null) {
    //   args = arg as Map;
    // }
    print(settings.name);
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => Splash(), fullscreenDialog: fullScreen);
      case '/login':
        return MaterialPageRoute(
            builder: (_) => const Login(), fullscreenDialog: fullScreen);
      case '/main_nav':
        return MaterialPageRoute(
            builder: (_) => BottomNavigation(), fullscreenDialog: fullScreen);
      case '/home':
        return MaterialPageRoute(
            builder: (_) => HomeView(), fullscreenDialog: fullScreen);
      case '/search':
        return MaterialPageRoute(
            builder: (_) => const Search(), fullscreenDialog: fullScreen);
      case '/playlist-details':
        return MaterialPageRoute(
          builder: (_) => Playlist(
            playlist: arg as PlaylistModel,
          ),
          fullscreenDialog: fullScreen,
        );
      case '/music-player':
        return MaterialPageRoute(
          builder: (_) => MusicPlayer(),
          fullscreenDialog: true,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("Page not found"),
            ),
          ),
        );
    }
  }
}
