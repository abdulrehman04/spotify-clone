import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget poppinsText(data,
    {double size = 14,
    color = Colors.black,
    weight = FontWeight.w400,
    align = TextAlign.center,
    overflow = false,
    maxLines = 1}) {
  return Text(
    data,
    maxLines: maxLines,
    overflow: overflow ? TextOverflow.ellipsis : null,
    style: GoogleFonts.poppins(
      fontSize: size.sp,
      fontWeight: weight,
      color: color,
    ),
    textAlign: align,
  );
}
