import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/cart_screen/check_out_screen.dart';

import '../../../../../../core/colors/colors.dart';
import '../../../../../../core/shared_widget/custom_button.dart';
import '../../../../../../core/text_style/styles.dart';

Widget CartBottomSheet(context)=>Container(
  height: 250.h,
  child: Padding(
    padding: EdgeInsetsDirectional.symmetric(vertical: 10.h,horizontal: 20.w),
    child: Column(
      children: [
        Text(
          'Selected item:',
          style: Styles.textStyle16.copyWith
            (fontWeight: FontWeight.w700,
              color: CustomColors.grey),),
        Row(
          children: [
            Text('Slovy bag:',style: Styles.textStyle12.copyWith(color: CustomColors.grey,fontWeight: FontWeight.w400),),
            Spacer(),
            Text('\$${240.00}',style: Styles.textStyle16.copyWith(color: CustomColors.darkGrey,fontWeight: FontWeight.w400),)
          ],
        ),
        Row(
          children: [
            Text('Orlando Watch',style: Styles.textStyle12.copyWith(color: CustomColors.grey,fontWeight: FontWeight.w400),),
            Spacer(),
            Text('\$${120}',style: Styles.textStyle16.copyWith(color: CustomColors.darkGrey),)
          ],
        ),
        Text('---------------------------------------------',style: Styles.textStyle12.copyWith(color: CustomColors.grey),),
        Row(
          children: [
            Text('Total Payment',style: Styles.textStyle16.copyWith(color: CustomColors.textColor),),
            Spacer(),
            Text('\$${250}',style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600,color: CustomColors.blue),)
          ],
        ),
        SizedBox(height: 15.h,),
        CustomButton(
            width: double.infinity,
            height: 56.h,
            radius: 12,
            backgroundColor: CustomColors.blue,
            text: 'Checkout Now',
            func:()
            {
              Navigator.pop(context);
              Navigator.of(context).pushNamed(CheckOutScreen.routeName);
            },
            style: Styles.textStyle16.copyWith(color: Colors.white,fontWeight: FontWeight.w600)
        ),
      ],
    ),
  ),
);