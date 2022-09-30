import 'package:flutter/material.dart';
import 'package:spotify_clone/globals/poppins_text.dart';

Widget playlistItem(image, title, artist) {
  return ListTile(
    leading: Image.network(
      image,
      height: 65,
    ),
    title: poppinsText(
      title,
      color: Colors.white,
      align: TextAlign.start,
      size: 15,
      weight: FontWeight.w500,
    ),
    subtitle: poppinsText(
      artist,
      color: Colors.grey,
      align: TextAlign.start,
      size: 13,
    ),
  );
}
