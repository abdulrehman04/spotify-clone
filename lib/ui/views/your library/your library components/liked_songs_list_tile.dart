import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/globals/poppins_text.dart';

Widget likedSongsListTile(songs) {
  return ListTile(
    leading: Container(
      width: 58.w,
      height: 58.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.deepPurple[900]!,
            Colors.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Icon(
        Icons.favorite,
        size: 27,
        color: Colors.white,
      ),
    ),
    title: poppinsText(
      "Liked Songs",
      color: Colors.white,
      align: TextAlign.start,
      size: 15,
      weight: FontWeight.w500,
    ),
    subtitle: poppinsText(
      "$songs songs",
      color: Colors.grey,
      align: TextAlign.start,
      size: 13,
    ),
  );
}
