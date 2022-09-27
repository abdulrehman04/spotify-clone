import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/globals/poppins_text.dart';
import 'package:spotify_clone/services/custom_navigation_service.dart';
import '../../app/locator.dart';

Widget recentPlayList(image, title) {
  CustomNavigationService nav = locator<CustomNavigationService>();
  return Container(
    height: 50.h,
    margin: const EdgeInsets.symmetric(horizontal: 3),
    width: 175.w,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 50.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                bottomLeft: Radius.circular(4),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.only(left: 10),
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
            ),
            child: Center(
              child: poppinsText(
                title,
                align: TextAlign.start,
                color: Colors.white,
                weight: FontWeight.w500,
                size: 12,
                maxLines: 2,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
