import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class Styles {
  static  TextStyle textStyle32 = TextStyle(
    fontSize: 32.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    letterSpacing: -0.48,
  );
  static const textStyle24 = TextStyle(
    color: Color(0xFF171717),
    fontSize: 24,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );

  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );
  static const textStyle16 = TextStyle(
    color: Color(0xFF171717),
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    letterSpacing: 0.02,
  );
  static const textStyle14 = TextStyle(
    color: Color(0xFF767474),
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    letterSpacing: 0.02,
  );

  static const textStyle12 = TextStyle(
    color: Color(0xFF746F6F),
    fontSize: 12,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    letterSpacing: 0.05,
  );
}