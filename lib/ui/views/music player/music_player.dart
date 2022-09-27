import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/mock%20data/dummy_data.dart';
import 'package:spotify_clone/app/locator.dart';
import 'package:spotify_clone/globals/poppins_text.dart';
import 'package:spotify_clone/services/custom_navigation_service.dart';
import 'package:spotify_clone/view%20models/music%20player%20view%20model/music_player_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MusicPlayer extends StatelessWidget {
  MusicPlayer({Key? key}) : super(key: key);

  final CustomNavigationService nav = locator<CustomNavigationService>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MusicPlayerViewModel>.reactive(
      viewModelBuilder: () => MusicPlayerViewModel(),
      builder: (context, model, child) {
        return Scaffold(
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              nav.back();
                            },
                            child: const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          poppinsText(
                            'cold/mess',
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
                        height: 50.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.network(images[0]),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      ListTile(
                        title: poppinsText(
                          "cold/mess",
                          color: Colors.white,
                          weight: FontWeight.w600,
                          align: TextAlign.start,
                          size: 15,
                        ),
                        subtitle: poppinsText(
                          "Prateek Kuhad",
                          color: Colors.white70,
                          weight: FontWeight.w400,
                          align: TextAlign.start,
                          size: 14,
                        ),
                      ),
                      SliderTheme(
                        data: const SliderThemeData(
                          activeTrackColor: Colors.white,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 0),
                          inactiveTrackColor: Colors.white70,
                          trackHeight: 1,
                        ),
                        child: Slider(
                          max: !model.initialised
                              ? 0.0
                              : model.player1.duration!.inSeconds.toDouble(),
                          value: model.player1.position.inSeconds.toDouble(),
                          onChanged: (val) {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 21),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  : model.formatTime(model.player1.duration!),
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
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.white,
                            ),
                            const Icon(
                              Icons.skip_previous_rounded,
                              color: Colors.white,
                              size: 35,
                            ),
                            Container(
                              // height: 35.h,
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: InkWell(
                                onTap: () {
                                  model.play();
                                },
                                child: Icon(
                                  model.playing
                                      ? Icons.pause_rounded
                                      : Icons.play_arrow_rounded,
                                  size: 35,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.skip_next_rounded,
                              color: Colors.white,
                              size: 35,
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
              ),
            ],
          ),
        );
      },
    );
  }
}
