import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  static  TextStyle textStyle32 = GoogleFonts.poppins(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.48,
  );
  static TextStyle textStyle24 = GoogleFonts.poppins(
    color: Color(0xFF171717),
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle textStyle20 = GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle textStyle16 = GoogleFonts.poppins(
    color: Color(0xFF171717),
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.02,
  );
  static TextStyle textStyle14 = GoogleFonts.poppins(
    color: Color(0xFF767474),
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.02,
  );

  static TextStyle textStyle12 = GoogleFonts.poppins(
    color: Color(0xFF746F6F),
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.05,
  );
}