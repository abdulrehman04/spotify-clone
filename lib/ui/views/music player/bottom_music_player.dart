import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/app/locator.dart';
import 'package:spotify_clone/globals/poppins_text.dart';
import 'package:spotify_clone/services/custom_navigation_service.dart';
import 'package:spotify_clone/ui/views/music%20player/music_player.dart';
import 'package:spotify_clone/view%20models/music%20player%20view%20model/music_player_view_model.dart';
import 'package:stacked/stacked.dart';

Widget bottomMusicPlayer() {
  return ViewModelBuilder<MusicPlayerViewModel>.reactive(
    viewModelBuilder: () => locator<MusicPlayerViewModel>(),
    builder: (context, model, child) {
      return (!model.songSet || model.isFullScreen)
          ? Container()
          : InkWell(
              onTap: () {
                model.updateFullScreen(true);
                showBottomSheet(
                    context: locator<CustomNavigationService>()
                        .getCurrentInUseKey()
                        .currentState!
                        .context,
                    builder: (context) {
                      return MusicPlayer();
                    });
                // nav.navigateTo('/music-model');
              },
              child: Container(
                height: 50.h,
                width: 372.72.w,
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
                          image: DecorationImage(
                            image: NetworkImage(
                              model.currentSong.coverImg,
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
                              model.currentSong.name,
                              size: 13,
                              align: TextAlign.start,
                              color: Colors.white,
                              weight: FontWeight.w500,
                            ),
                            poppinsText(
                              model.currentSong.artistName,
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
    },
  );
}
