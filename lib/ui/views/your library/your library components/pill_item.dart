import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/globals/poppins_text.dart';

Widget pillItem(title) {
  return Container(
    height: 25.h,
    padding: const EdgeInsets.symmetric(
      horizontal: 15,
    ),
    margin: const EdgeInsets.symmetric(horizontal: 4),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.grey),
    ),
    child: Center(
      child: poppinsText(
        title,
        color: Colors.white,
      ),
    ),
  );
}
