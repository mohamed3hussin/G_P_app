import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';

class ApplicationTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF1B72C0)),
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: CustomColors.blue,
      ),
      elevation: 0,
      centerTitle: true,
      titleTextStyle: Styles.textStyle24,
        toolbarHeight: 90.h,
        backgroundColor: Color(0xFFEFF1F8),
        titleSpacing: 4,
    ),
  );
}
