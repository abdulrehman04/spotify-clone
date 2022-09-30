import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/app/locator.dart';
import 'package:spotify_clone/constants.dart';
import 'package:spotify_clone/globals/poppins_text.dart';
import 'package:spotify_clone/mock%20data/dummy_data.dart';
import 'package:spotify_clone/ui/views/your%20library/your%20library%20components/liked_songs_list_tile.dart';
import 'package:spotify_clone/ui/views/your%20library/your%20library%20components/pill_item.dart';
import 'package:spotify_clone/view%20models/your_library%20view%20model/your_library_view_model.dart';
import 'package:stacked/stacked.dart';
import 'your library components/artist_item.dart';
import 'your library components/playlist_item.dart';

class YourLibrary extends StatelessWidget {
  const YourLibrary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ksecondaryClr,
      body: ViewModelBuilder<YourLibraryViewModel>.reactive(
        viewModelBuilder: () => locator<YourLibraryViewModel>(),
        builder: (context, model, child) {
          return SafeArea(
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    expandedHeight: 105.h,
                    title: Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 19,
                                backgroundImage: NetworkImage(
                                  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Prateek_Kuhad_New.jpg/1200px-Prateek_Kuhad_New.jpg',
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              poppinsText(
                                "Your Library",
                                size: 22,
                                weight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.search,
                                size: 27,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              const Icon(
                                Icons.add,
                                size: 27,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              pillItem("Playlists"),
                              pillItem("Artists"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: Column(
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  likedSongsListTile(2),
                  SizedBox(
                    height: 3.h,
                  ),
                  ...(model.getLikedPlaylists().map((e) {
                    return Column(
                      children: [
                        playlistItem(e.coverImage, e.name, e.artist.name),
                        SizedBox(
                          height: 3.h,
                        ),
                      ],
                    );
                  }).toList()),
                  artistItem(images[3], "Test"),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
