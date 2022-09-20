import 'package:flutter/material.dart';
import 'package:spotify_clone/constants.dart';
import 'package:spotify_clone/globals/box_shad.dart';
import 'package:spotify_clone/globals/poppins_text.dart';

Widget longButton(
  title,
  onTap, {
  double height = 50,
  color = ksecondaryClr,
  borderClr = Colors.grey,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: height,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: color,
          border: Border.all(
            color: borderClr,
          )
          // boxShadow: [boxShad(0, 0, 15)],
          ),
      child: Center(
        child: poppinsText(
          title,
          size: 15,
          color: Colors.white,
          weight: FontWeight.w500,
        ),
      ),
    ),
  );
}
