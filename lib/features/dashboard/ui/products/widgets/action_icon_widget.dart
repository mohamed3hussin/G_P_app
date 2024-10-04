import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const ActionIcon({Key? key, required this.icon, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: const Color(0xFFFCFCFC),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 6.60,
            offset: Offset(2, 4),
            spreadRadius: 0,
          )
        ],
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Icon(icon, color: color, size: 21),
    );
  }
}
