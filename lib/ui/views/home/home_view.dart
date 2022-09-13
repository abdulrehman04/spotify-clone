import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/app/dummy_data.dart';
import 'package:spotify_clone/constants.dart';
import 'package:spotify_clone/globals/poppins_text.dart';
import 'package:spotify_clone/ui/views/home/home%20components/recently_played_widget.dart';
import 'package:spotify_clone/ui/views/home/home%20components/title_and_artists.dart';
import 'package:spotify_clone/ui/views/home/home%20components/title_and_playlist.dart';
import 'package:spotify_clone/ui/views/music%20player/bottom_music_player.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ksecondaryClr,
      bottomNavigationBar: bottomMusicPlayer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    poppinsText(
                      "Good Evening",
                      size: 24,
                      weight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    const Icon(
                      Icons.settings_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                recentlyPlayedWidget(),
                SizedBox(
                  height: 20.h,
                ),
                titleAndPlaylist("Recently Played", [
                  {
                    'title': "Shawn Mendez",
                    'image': images[2],
                  },
                  {
                    'title': "Riha",
                    'image': images[1],
                  },
                  {
                    'title': "The way that lovers do",
                    'image': images[0],
                  },
                  {
                    'title': "Scars & Screws",
                    'image': images[3],
                  },
                ]),
                SizedBox(
                  height: 20.h,
                ),
                titleAndPlaylist("New Releases", [
                  {
                    'title': "The way that lovers do",
                    'image': images[0],
                  },
                  {
                    'title': "Scars & Screws",
                    'image': images[3],
                  },
                  {
                    'title': "Shawn Mendez",
                    'image': images[2],
                  },
                  {
                    'title': "Riha",
                    'image': images[1],
                  },
                ]),
                SizedBox(
                  height: 20.h,
                ),
                titleAndArtists("Artists you love", [
                  {
                    'title': "Riha",
                    'image': images[1],
                  },
                  {
                    'title': "Shawn Mendez",
                    'image': images[2],
                  },
                  {
                    'title': "Scars & Screws",
                    'image': images[3],
                  },
                  {
                    'title': "The way that lovers do",
                    'image': images[0],
                  },
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
