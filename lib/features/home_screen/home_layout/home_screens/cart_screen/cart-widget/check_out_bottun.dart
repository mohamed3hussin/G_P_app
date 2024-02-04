import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/colors/colors.dart';
import '../../../../../../core/shared_widget/custom_button.dart';
import '../../../../../../core/text_style/styles.dart';
import 'cart_bottom_sheet.dart';

Widget CheckoutBottun(context)=>Material(
  elevation: 1,
  //borderRadius: BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14)),
  child: Container(
    margin: EdgeInsets.only(bottom: 80.h),
    height: 105.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14)),

    ),
    child: Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w,vertical: 15.h),
      child: Column(
        children: [

          CustomButton(
              width: double.infinity,
              height: 56.h,
              radius: 12,
              backgroundColor: CustomColors.blue,
              text: 'Checkout Now',
              func:()
              {
                showModalBottomSheet(context: context, builder: (context)=>CartBottomSheet(context),);
              },
              style: Styles.textStyle16.copyWith(color: Colors.white,fontWeight: FontWeight.w600)
          ),
        ],
      ),
    ),
  ),
);