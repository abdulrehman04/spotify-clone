import 'package:flutter/material.dart';
import 'package:spotify_clone/globals/poppins_text.dart';

Widget heading1(title) {
  return poppinsText(
    title,
    size: 21,
    color: Colors.white,
    weight: FontWeight.w600,
    align: TextAlign.start,
  );
}
