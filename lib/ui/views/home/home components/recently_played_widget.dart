import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/app/dummy_data.dart';
import 'package:spotify_clone/ui/widgets/recent_playlists.dart';

recentlyPlayedWidget() {
  return Column(
    children: [
      Row(
        children: [
          recentPlayList(
            images[0],
            "The way that lovers do",
          ),
          recentPlayList(
            images[1],
            "Mujhe maar do",
          ),
        ],
      ),
      SizedBox(
        height: 7.h,
      ),
      Row(
        children: [
          recentPlayList(
            images[2],
            "Shawn Mendez",
          ),
          recentPlayList(
            images[3],
            "Scars & Screws",
          ),
        ],
      ),
    ],
  );
}
