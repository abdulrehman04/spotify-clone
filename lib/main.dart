import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/app/locator.dart';
import 'package:spotify_clone/app/router.dart';
import 'package:spotify_clone/firebase_options.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
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
          navigatorKey: StackedService.navigatorKey,
          onGenerateRoute: RouteGen.onGenRoute,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        );
      }),
    );
  }
}
