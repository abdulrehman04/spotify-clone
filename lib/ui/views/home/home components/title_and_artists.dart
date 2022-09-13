import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/globals/heading_1.dart';
import 'package:spotify_clone/ui/widgets/artists_item.dart';

titleAndArtists(title, List items) {
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
            return artistItem(
              e['image'],
              e['title'],
            );
          }).toList(),
        ),
      ),
    ],
  );
}
