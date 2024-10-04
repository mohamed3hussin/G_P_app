import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ColorContainer extends StatefulWidget {
  Color color;
  bool isSelected;
  VoidCallback onTap;

  ColorContainer({super.key, 
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<ColorContainer> createState() => _ColorContainerState();
}

class _ColorContainerState extends State<ColorContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.only(top: 8.h, bottom: 8.h, right: 16.w),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.color,
          border: Border.all(width: 1, color: const Color(0xFF000000)),
        ),
        child: widget.isSelected?Icon(Icons.check,color: widget.color==Colors.white?Colors.black:Colors.white,size: 35,):const SizedBox(),
      ),

    );
  }
}
