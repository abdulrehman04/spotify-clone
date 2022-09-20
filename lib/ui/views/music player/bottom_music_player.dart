import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/app/locator.dart';
import 'package:spotify_clone/globals/poppins_text.dart';
import 'package:stacked_services/stacked_services.dart';

Widget bottomMusicPlayer() {
  NavigationService nav = locator<NavigationService>();

  return InkWell(
    onTap: () {
      nav.navigateTo('/music-player', arguments: {
        'full': true,
      }, transition: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      });
    },
    child: Container(
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey[800],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                image: const DecorationImage(
                  image: NetworkImage(
                    "https://i.scdn.co/image/ab67616d0000b273099bfbcf7ced6e82f8a797c7",
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  poppinsText(
                    "Mine",
                    size: 13,
                    align: TextAlign.start,
                    color: Colors.white,
                    weight: FontWeight.w500,
                  ),
                  poppinsText(
                    "Bazzi",
                    size: 12,
                    align: TextAlign.start,
                    weight: FontWeight.w500,
                    color: Colors.white70,
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            child: Icon(
              Icons.favorite,
              size: 25,
              color: Colors.white,
            ),
          ),
          const Expanded(
            child: Icon(
              Icons.play_arrow_rounded,
              size: 36,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}
