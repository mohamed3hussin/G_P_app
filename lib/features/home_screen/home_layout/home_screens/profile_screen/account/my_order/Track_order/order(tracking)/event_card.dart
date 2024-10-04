import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/text_style/styles.dart';

class EventCard extends StatelessWidget {
  String process;
  String address;
  EventCard({super.key, required this.process,required this.address});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12.w,right: 12.w,top: 10.h),
      width: 150.w,
      height: 50.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(process,style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
          SizedBox(height: 5.h,),
          Text(address,style: Styles.textStyle12,),
        ],
      ),
    );
  }

}
