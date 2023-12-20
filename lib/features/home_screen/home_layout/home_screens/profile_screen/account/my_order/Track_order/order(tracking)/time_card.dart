import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/text_style/styles.dart';

class TimeCard extends StatelessWidget {
  String date;
  String time;
  TimeCard({required this.date,required this.time});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      width: 45.w,
      height: 50.h,
      child: Column(
        children: [
          Text(date,style: Styles.textStyle12!.copyWith(fontWeight: FontWeight.bold),),
          SizedBox(height: 5.h,),
          Text(time,style: Styles.textStyle12,),
        ],
      ),
    );
  }

}
