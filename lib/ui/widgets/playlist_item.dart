import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/globals/poppins_text.dart';

Widget playlistItem(image, title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Column(
      children: [
        Stack(
          children: [
            Container(
              height: 150.h,
              width: 150.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(
                'assets/logo_grey.png',
                height: 15.h,
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          width: 150.w,
          child: poppinsText(
            title,
            color: Colors.white70,
            overflow: true,
            maxLines: 2,
            align: TextAlign.start,
          ),
        )
      ],
    ),
  );
}
