import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/app/locator.dart';
import 'package:spotify_clone/app/router.dart';
import 'package:spotify_clone/firebase_options.dart';
import 'package:spotify_clone/services/custom_navigation_service.dart';
import 'package:spotify_clone/ui/views/music%20player/bottom_music_player.dart';
import 'package:spotify_clone/view%20models/music%20player%20view%20model/music_player_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MusicPlayerViewModel music = locator<MusicPlayerViewModel>();

  setHere() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    music.onSongSet(setHere);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.72, 759.27),
      builder: ((context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Spotify Clone',
          navigatorKey: locator<CustomNavigationService>().navigationKey,
          onGenerateRoute: RouteGen.onGenRoute,
          builder: (context, Widget? child) {
            return Scaffold(
              body: Stack(
                children: [
                  child!,
                  Positioned(
                    bottom: 60,
                    // child: InkWell(
                    //   onTap: () {
                    //     showBottomSheet(
                    //         context: context,
                    //         builder: (context) {
                    //           return Container(
                    //             color: Colors.red,
                    //           );
                    //         });
                    //   },
                    //   child: Container(
                    //     height: 50.h,
                    //     width: 372.72.w,
                    //     color: Colors.white,
                    //     child: Text("OOOP"),
                    //   ),
                    // ),
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
