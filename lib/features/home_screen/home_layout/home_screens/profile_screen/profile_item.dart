import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';

class ProfileItem extends StatelessWidget {
  IconData icon;
  String text;
  String? description;
  bool arrowIcon;
  Function? onClicked;

  ProfileItem({required this.icon, required this.text, this.description,this.arrowIcon = true,this.onClicked});

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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Icon(
                icon,
                color: CustomColors.blue,
              ),
            ),
            description==null?Text(
              text,
              style: Styles.textStyle16,
            ):Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: Styles.textStyle16,),
                Text(description!,style: Styles.textStyle12,overflow: TextOverflow.ellipsis,),
              ],
            ),
            //SizedBox(width: 100.w,),
            Expanded(
                child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: arrowIcon
                      ? Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: CustomColors.blue,
                        )
                      : SizedBox()),
            ))
          ],
        ),
      ),
    );
  }
}
