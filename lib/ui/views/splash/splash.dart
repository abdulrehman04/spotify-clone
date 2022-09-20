import 'package:flutter/material.dart';
import 'package:spotify_clone/constants.dart';
import 'package:spotify_clone/services/user_auth_service.dart';
import 'package:spotify_clone/ui/views/auth/login.dart';
import 'package:spotify_clone/ui/views/home/home_view.dart';
import 'package:spotify_clone/view%20models/splash%20view%20model/splash_view_model.dart';
import 'package:stacked/stacked.dart';

class Splash extends StatelessWidget {
  // final SplashViewModel vm = locator<SplashViewModel>();

  Splash({Key? key}) : super(key: key) {
    init();
  }

  init() async {
    // bool fetchResult = await vm.fetchData();
    // if (fetchResult) {
    //   vm.getToLogin();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.nonReactive(
        viewModelBuilder: () => SplashViewModel(),
        onModelReady: (model) async {
          await model.fetchData();
          await model.authService.isUserLoggedIn();
        },
        builder: (context, model, child) {
          return StreamBuilder(
              stream: model.authService.loggedIn.stream,
              builder: (context, snap) {
                print(snap.data);
                if (!snap.hasData || snap.data == LoginStates.waiting) {
                  return Scaffold(
                    backgroundColor: ksecondaryClr,
                    body: Center(
                      child: Image.asset(
                        'assets/logo.png',
                        height: 120,
                      ),
                    ),
                  );
                } else if (snap.data == LoginStates.loggedIn) {
                  return HomeView();
                } else {
                  return Login();
                }
              });
        });
  }
}
