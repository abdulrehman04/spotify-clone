import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../globals/poppins_text.dart';

Widget artistItem(image, name) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Column(
      children: [
        Container(
          height: 150.h,
          width: 150.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          width: 150.w,
          child: poppinsText(
            name,
            color: Colors.white,
            overflow: true,
            weight: FontWeight.w500,
          ),
        )
      ],
    ),
  );
}
