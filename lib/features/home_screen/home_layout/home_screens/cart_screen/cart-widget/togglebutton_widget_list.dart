import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/text_style/styles.dart';

List<Widget> toggleButtonWidgetList(){
  return[
    Container(
      width: 65.w,
      height: 50.h,
      margin: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('10 EGP',style: Styles.textStyle16,),
          Text('1-2 Days',style: Styles.textStyle12,),
        ],
      ),
    ),
    Container(
      width: 65.w,
      height: 50.h,
      margin: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('5 EGP',style: Styles.textStyle16,),
          Text('2-5 Days',style: Styles.textStyle12,),
        ],
      ),
    ),
    Container(
      width: 65.w,
      height: 50.h,
      margin: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('2 EGP',style: Styles.textStyle16,),
          Text('5-7 Days',style: Styles.textStyle12,),
        ],
      ),
    ),
    Container(
      width: 65.w,
      height: 50.h,
      margin: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Free!',style: Styles.textStyle16,),
          Text('1-2 weeks',style: Styles.textStyle12,),
        ],
      ),
    ),
  ];
}