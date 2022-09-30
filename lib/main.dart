import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/app/locator.dart';
import 'package:spotify_clone/app/router.dart';
import 'package:spotify_clone/firebase_options.dart';
import 'package:spotify_clone/globals/poppins_text.dart';
import 'package:spotify_clone/services/custom_navigation_service.dart';
import 'package:spotify_clone/ui/views/music%20player/bottom_music_player.dart';
import 'package:spotify_clone/ui/views/splash/splash.dart';
import 'package:spotify_clone/view%20models/music%20player%20view%20model/music_player_view_model.dart';

Future<void> main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.72, 759.27),
      builder: ((context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Spotify Clone',
          home: Splash(),
          onGenerateRoute: RouteGen.onGenRoute,
          builder: (context, Widget? child) {
            return Scaffold(
              body: Stack(
                children: [
                  child!,
                  Positioned(
                    bottom: 60,
                    child: bottomMusicPlayer(),
                  ),
                ],
              ),
            );
          },
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        );
      }),
    );
  }
}
