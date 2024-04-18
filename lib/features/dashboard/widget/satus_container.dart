import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';

import '../../../core/text_style/styles.dart';

class StatusContainer extends StatefulWidget {
  String text;
  Color? background;
  bool color;

  StatusContainer(this.text,this.color,{this.background});
  @override
  State<StatusContainer> createState() => _StatusContainerState();

}

class _StatusContainerState extends State<StatusContainer> {
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

        height: 40,
        decoration: ShapeDecoration(
          color: Color(0xFFFCFCFF),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color:isSelected?Colors.black: CustomColors.lightGrey),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w),
          child: Center(
              child:
              Row(
                children: [
                  if(widget.color)
                    CircleAvatar(
                    radius: 5.r,
                    backgroundColor: widget.background,
                  ),
                  if(widget.color)
                    SizedBox(width: 5.w,),
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 3.w),
                    child: Text(widget.text,style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w400,
                    color: CustomColors.darkBlue),),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
