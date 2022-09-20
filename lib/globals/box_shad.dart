import 'package:flutter/material.dart';

boxShad(double x, double y, double b) {
  return BoxShadow(
    color: const Color(0xdd000000).withOpacity(0.2),
    offset: Offset(x, y),
    blurRadius: b,
  );
}
