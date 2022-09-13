import 'package:flutter/material.dart';
import 'package:spotify_clone/ui/views/home/home_view.dart';
import 'package:spotify_clone/ui/views/splash.dart';

class RouteGen {
  static Route<dynamic> onGenRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Splash());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeView());
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
