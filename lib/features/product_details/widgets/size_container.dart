import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/text_style/styles.dart';

class SizeContainer extends StatefulWidget {
  String text;

  SizeContainer(this.text);
  @override
  State<SizeContainer> createState() => _SizeContainerState();
}
class _SizeContainerState extends State<SizeContainer> {
  bool isSelected=false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          isSelected=!isSelected;
        });
      },
      child: Container(
        margin: EdgeInsets.only(top: 8.h,bottom: 8.h,right: 16.w),
        width: 40,
        height: 40,
        decoration: ShapeDecoration(
          color: isSelected?Colors.black87:Color(0xFFFCFCFF),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFF000000)),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Center(child: Text(widget.text,style: Styles.textStyle14!.copyWith(color: isSelected?Colors.white:Colors.black),)),
      ),
    );
  }
}
