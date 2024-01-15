import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';

class ProfileItemWithCheckIcon extends StatefulWidget {
  String text;
  Function? onClicked;
  bool isSelected;
  ProfileItemWithCheckIcon({required this.text,this.onClicked,this.isSelected=false});

  @override
  State<ProfileItemWithCheckIcon> createState() => _ProfileItemWithCheckIconState();
}

class _ProfileItemWithCheckIconState extends State<ProfileItemWithCheckIcon> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.h),
      child: Container(
        width: 340.w,
        height: 60.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r), color: Color(0xFFEFEFEF)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                widget.text,
                style: Styles.textStyle16,
              ),
            ),
            //SizedBox(width: 100.w,),
            Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: widget.isSelected?Icon(Icons.done,color: CustomColors.green,):SizedBox(),
                )))
          ],
        ),
      ),
    );
  }
}
