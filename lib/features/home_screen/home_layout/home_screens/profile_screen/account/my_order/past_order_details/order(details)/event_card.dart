import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/text_style/styles.dart';

class EventCard extends StatelessWidget {
  String process;
  String date;
  EventCard({required this.process,required this.date});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24.w),
      width: 125.w,
      height: 50.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(process,style: Styles.textStyle14!.copyWith(fontWeight: FontWeight.bold,color: Colors.black),),
          SizedBox(height: 5.h,),
          Text(date,style: Styles.textStyle12,),
        ],
      ),
    );
  }

}
