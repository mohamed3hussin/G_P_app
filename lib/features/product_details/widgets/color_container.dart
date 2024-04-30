import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorContainer extends StatefulWidget {
  Color color;

  ColorContainer(this.color);

  @override
  State<ColorContainer> createState() => _ColorContainerState();
}

class _ColorContainerState extends State<ColorContainer> {
  bool? isChecked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h,right: 10.w),
      child: Transform.scale(
        scale: 2.5,
        child: Checkbox(
          fillColor: MaterialStatePropertyAll(widget.color),
          shape: CircleBorder(),
          side: widget.color == Colors.white ? BorderSide(color: Colors.black,width: 0.5) : BorderSide.none,
          checkColor: widget.color == Colors.white ? Colors.black: Colors.white,
          value: isChecked ?? false,
          onChanged: (newBool){
            setState(() {
            });
            isChecked=newBool;
          },
        ),
      ),
    );
  }
}