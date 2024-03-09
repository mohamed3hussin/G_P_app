import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/assets_data/assetsData.dart';
import '../../../../../../core/colors/colors.dart';
import '../../../../../../core/text_style/styles.dart';

Widget CheckoutPayCash(groupValue)=>Container(
  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: CustomColors.darkGrey)
  ),
  child: Padding(
    padding: EdgeInsetsDirectional.symmetric(vertical: 5.h,horizontal: 5.w),
    child: Row(
      children: [
        Image.asset(AssetsData.cashImage,height: 60,width: 60,),
        SizedBox(width: 5,),
        Text(
          'Cash',
          style: Styles.textStyle16.copyWith(
              color: CustomColors.textColor,
              fontWeight: FontWeight.w400
          ),),
        Spacer(),
        Radio(activeColor: CustomColors.darkGrey,value: 'cash', groupValue: groupValue, onChanged: (value)
        {
          //cubit fun her
          groupValue = value!;
        })
      ],
    ),
  ),
);