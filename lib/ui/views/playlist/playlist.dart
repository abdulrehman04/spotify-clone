import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/app/locator.dart';
import 'package:spotify_clone/constants.dart';
import 'package:spotify_clone/globals/poppins_text.dart';
import 'package:spotify_clone/mock%20data/dummy_data.dart';
import 'package:spotify_clone/models/playlist_model.dart';
import 'package:spotify_clone/view%20models/music%20player%20view%20model/music_player_view_model.dart';
import 'package:spotify_clone/view%20models/playlist%20view%20model/playlist_view_model.dart';
import 'package:stacked/stacked.dart';

class Playlist extends StatefulWidget {
  final PlaylistModel playlist;
  Playlist({Key? key, required this.playlist}) : super(key: key);

  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  MusicPlayerViewModel music = locator<MusicPlayerViewModel>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PlaylistViewModel>.reactive(
        viewModelBuilder: () => PlaylistViewModel(),
        onModelReady: (model) => model.init(widget.playlist),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: ksecondaryClr,
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    backgroundColor: ksecondaryClr,
                    expandedHeight: 340.h,
                    floating: true,
                    stretch: true,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      titlePadding: const EdgeInsets.only(left: 15, bottom: 5),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          poppinsText(
                            widget.playlist.name,
                            align: TextAlign.start,
                            color: Colors.white,
                            size: 15,
                            weight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 6,
                                backgroundImage: NetworkImage(
                                  widget.playlist.artist.image,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              poppinsText(
                                widget.playlist.artist.name,
                                color: Colors.white,
                                weight: FontWeight.w600,
                                size: 8,
                              )
                            ],
                          ),
                        ],
                      ),
                      background: SafeArea(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 283.9.h,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 65,
                                  vertical: 15,
                                ),
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.grey,
                                      ksecondaryClr,
                                    ],
                                  ),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        widget.playlist.coverImage,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: Container(
                color: ksecondaryClr,
                padding: const EdgeInsets.all(15),
                child: !model.fetchedSongs
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.green,
                        ),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.green,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(
                                      Icons.more_vert,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    model.setPlaylistThroughService(
                                      widget.playlist,
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green,
                                    ),
                                    child: const Icon(
                                      Icons.play_arrow_rounded,
                                      size: 28,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            ...model.playlist.fetchedSongs.map((e) {
                              return ListTile(
                                onTap: () {
                                  model.setPlaylistAndSongThroughService(
                                    widget.playlist,
                                    model.playlist.fetchedSongs.indexOf(e),
                                  );
                                },
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 0,
                                ),
                                leading: Image.network(
                                  e.coverImg,
                                  height: 45,
                                ),
                                title: poppinsText(
                                  e.name,
                                  color: Colors.white,
                                  align: TextAlign.start,
                                  size: 15,
                                  weight: FontWeight.w500,
                                ),
                                subtitle: poppinsText(
                                  e.artistName,
                                  color: Colors.grey,
                                  align: TextAlign.start,
                                  size: 13,
                                ),
                                trailing: const Icon(
                                  Icons.more_vert,
                                  color: Colors.grey,
                                ),
                              );
                            }).toList()
                          ],
                        ),
                      ),
              ),
            ),
          );
        });
  }
}
