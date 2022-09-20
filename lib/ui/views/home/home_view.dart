import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/mock%20data/dummy_data.dart';
import 'package:spotify_clone/app/locator.dart';
import 'package:spotify_clone/constants.dart';
import 'package:spotify_clone/globals/poppins_text.dart';
import 'package:spotify_clone/repository/data_repo.dart';
import 'package:spotify_clone/ui/views/home/home%20components/recently_played_widget.dart';
import 'package:spotify_clone/ui/views/home/home%20components/title_and_artists.dart';
import 'package:spotify_clone/ui/views/home/home%20components/title_and_playlist.dart';
import 'package:spotify_clone/ui/views/music%20player/bottom_music_player.dart';
import 'package:spotify_clone/view%20models/home%20view%20model/home_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  // final HomeViewModel homeViewModel = locator<HomeViewModel>();
  final DataRepo dataRepo = locator<DataRepo>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) {
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
                          "Good ${model.getWelcomeMsg()}",
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
                    titleAndPlaylist("Recently Played", dataRepo.playlists),
                    SizedBox(
                      height: 20.h,
                    ),
                    titleAndPlaylist("New Releases", dataRepo.playlists),
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
      },
    );
  }
}
