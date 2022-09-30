import 'package:flutter/material.dart';
import 'package:spotify_clone/globals/poppins_text.dart';

Widget artistItem(image, title) {
  return ListTile(
    leading: CircleAvatar(
      backgroundImage: NetworkImage(image),
      radius: 27.5,
    ),
    title: poppinsText(
      title,
      color: Colors.white,
      align: TextAlign.start,
      size: 15,
      weight: FontWeight.w500,
    ),
    subtitle: poppinsText(
      "Artist",
      color: Colors.grey,
      align: TextAlign.start,
      size: 13,
    ),
  );
}
