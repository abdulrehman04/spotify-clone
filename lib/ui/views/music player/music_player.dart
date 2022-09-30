import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/app/locator.dart';
import 'package:spotify_clone/globals/poppins_text.dart';
import 'package:spotify_clone/view%20models/music%20player%20view%20model/music_player_view_model.dart';
import 'package:stacked/stacked.dart';

Widget MusicPlayer() {
  return ViewModelBuilder<MusicPlayerViewModel>.reactive(
    viewModelBuilder: () => locator<MusicPlayerViewModel>(),
    disposeViewModel: false,
    builder: (context, model, child) {
      return WillPopScope(
        onWillPop: () {
          model.updateFullScreen(false);
          return Future.value(true);
        },
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff556064), Color(0xff161817)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              SafeArea(
                child: Scaffold(
                  body: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xff556064), Color(0xff161817)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 30, 12, 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    model.updateFullScreen(false);
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                                poppinsText(
                                  model.currentSong.name,
                                  color: Colors.white,
                                  weight: FontWeight.w600,
                                ),
                                const Icon(
                                  Icons.more_vert_sharp,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.network(model.currentSong.coverImg),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            ListTile(
                              title: poppinsText(
                                model.currentSong.name,
                                color: Colors.white,
                                weight: FontWeight.w600,
                                align: TextAlign.start,
                                size: 15,
                              ),
                              subtitle: poppinsText(
                                model.currentSong.artistName,
                                color: Colors.white70,
                                weight: FontWeight.w400,
                                align: TextAlign.start,
                                size: 14,
                              ),
                            ),
                            SliderTheme(
                              data: const SliderThemeData(
                                activeTrackColor: Colors.white,
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 0),
                                inactiveTrackColor: Colors.white70,
                                trackHeight: 1,
                              ),
                              child: Slider(
                                max: !model.initialised
                                    ? 0.0
                                    : model.player1.duration!.inSeconds
                                        .toDouble(),
                                value:
                                    model.player1.position.inSeconds.toDouble(),
                                onChanged: (val) {},
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 21),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  poppinsText(
                                    !model.initialised
                                        ? "--"
                                        : model.formatTime(model.position),
                                    color: Colors.white70,
                                    size: 12,
                                  ),
                                  poppinsText(
                                    !model.initialised
                                        ? "--"
                                        : model.formatTime(
                                            model.player1.duration!),
                                    color: Colors.white70,
                                    size: 12,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 22),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.white,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      model.prevSong();
                                    },
                                    child: const Icon(
                                      Icons.skip_previous_rounded,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      model.togglePlay();
                                    },
                                    child: Container(
                                      // height: 35.h,
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: Icon(
                                        model.playing
                                            ? Icons.pause_rounded
                                            : Icons.play_arrow_rounded,
                                        size: 35,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      model.nextSong();
                                    },
                                    child: const Icon(
                                      Icons.skip_next_rounded,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.remove_circle_outline,
                                    color: Colors.white,
                                    // size: 30,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
