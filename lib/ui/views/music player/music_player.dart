import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/mock%20data/dummy_data.dart';
import 'package:spotify_clone/app/locator.dart';
import 'package:spotify_clone/globals/poppins_text.dart';
import 'package:stacked_services/stacked_services.dart';

class MusicPlayer extends StatelessWidget {
  MusicPlayer({Key? key}) : super(key: key);

  NavigationService nav = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0),
                      inactiveTrackColor: Colors.white70,
                      trackHeight: 1,
                    ),
                    child: Slider(value: 0.8, onChanged: (val) {}),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        poppinsText(
                          '0:05',
                          color: Colors.white70,
                          size: 12,
                        ),
                        poppinsText(
                          '4:41',
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
                        Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.white,
                        ),
                        Icon(
                          Icons.skip_previous_rounded,
                          color: Colors.white,
                          size: 35,
                        ),
                        Container(
                          // height: 35.h,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.play_arrow_rounded,
                            size: 35,
                          ),
                        ),
                        Icon(
                          Icons.skip_next_rounded,
                          color: Colors.white,
                          size: 35,
                        ),
                        Icon(
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
  }
}
