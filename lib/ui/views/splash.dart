import 'dart:async';
import 'package:flutter/material.dart';
import 'package:spotify_clone/app/locator.dart';
import 'package:spotify_clone/constants.dart';
import 'package:stacked_services/stacked_services.dart';

class Splash extends StatelessWidget {
  Splash({Key? key}) : super(key: key) {
    NavigationService nav = locator<NavigationService>();
    Timer(const Duration(seconds: 2), () {
      nav.replaceWith('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ksecondaryClr,
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          height: 120,
        ),
      ),
    );
  }
}
