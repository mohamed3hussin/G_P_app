import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../text_style/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.backgroundColor,
    this.textColor = Colors.white,
    this.borderRadius,
    required this.text,
    this.fontSized,
    required this.func,
    this.width,
    this.height = 48,
    this.radius = 8,
    this.icon,
    required this.style,
  }) : super(key: key);
  final double? width;
  final double? height;
  final double radius;
  final Color backgroundColor;
  final Color? textColor;
  final BorderRadius? borderRadius;
  final double? fontSized;
  final String text;
  final VoidCallback func;
  final TextStyle style;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: func,
        style: ElevatedButton.styleFrom(
          // minimumSize: const Size(double.infinity, 0),
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          // minimumSize: Size(150, 50),
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon!=null?Padding(
              padding:EdgeInsets.symmetric(horizontal: 5.w),
              child: Icon(icon),
            ):SizedBox(),
            Text(
              text,
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}