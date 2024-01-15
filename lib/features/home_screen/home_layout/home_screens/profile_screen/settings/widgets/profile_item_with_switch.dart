import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';

class ProfileItemWithSwitch extends StatefulWidget {
  IconData icon;
  String text;
  Function? onClicked;

  ProfileItemWithSwitch({required this.icon, required this.text,this.onClicked});

  @override
  State<ProfileItemWithSwitch> createState() => _ProfileItemWithSwitchState();
}

class _ProfileItemWithSwitchState extends State<ProfileItemWithSwitch> {
  bool isSwitched=false;

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
                widget.icon,
                color: CustomColors.blue,
              ),
            ),
            Text(
              widget.text,
              style: Styles.textStyle16,
            ),
            //SizedBox(width: 100.w,),
            Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Switch(
                        trackOutlineWidth: MaterialStateProperty.all(1.5),
                        value: isSwitched,
                        onChanged: (value){
                          isSwitched=value;
                          setState(() {
                          });
                        },
                      ),
                )))
          ],
        ),
      ),
    );
  }
}
