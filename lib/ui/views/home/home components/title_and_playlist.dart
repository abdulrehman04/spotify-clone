import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/app/locator.dart';
import 'package:spotify_clone/globals/heading_1.dart';
import 'package:spotify_clone/models/playlist_model.dart';
import 'package:spotify_clone/services/custom_navigation_service.dart';
import 'package:spotify_clone/ui/views/playlist/playlist.dart';
import 'package:spotify_clone/ui/widgets/playlist_item.dart';

Widget titleAndPlaylist(title, List<PlaylistModel> items, context) {
  CustomNavigationService nav = locator<CustomNavigationService>();

  return Column(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: heading1(title),
      ),
      SizedBox(
        height: 20.h,
      ),
      SizedBox(
        height: 205.h,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: items.map((e) {
            return InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => Playlist(playlist: e),
                //   ),
                // );
                nav.navigateTo('/playlist-details', arguments: e);
              },
              child: playlistItem(
                e.coverImage,
                e.name,
              ),
            );
          }).toList(),
        ),
      ),
    ],
  );
}
