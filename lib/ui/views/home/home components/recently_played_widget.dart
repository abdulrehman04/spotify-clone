import 'package:flutter/material.dart';
import 'package:spotify_clone/app/locator.dart';
import 'package:spotify_clone/mock%20data/dummy_data.dart';
import 'package:spotify_clone/ui/widgets/recent_playlists.dart';
import 'package:spotify_clone/view%20models/home%20view%20model/home_view_model.dart';

recentlyPlayedWidget() {
  HomeViewModel homeViewModel = locator<HomeViewModel>();

  return Align(
    alignment: Alignment.topLeft,
    child: Wrap(
      runSpacing: 7,
      children: homeViewModel.dataRepo.recentPlaylists.map<Widget>((e) {
        return recentPlayList(
          images[0],
          "The way that lovers do",
        );
      }).toList(),
    ),
  );
}
