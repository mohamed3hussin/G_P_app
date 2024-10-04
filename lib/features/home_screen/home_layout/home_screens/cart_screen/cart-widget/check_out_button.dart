import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/data/model/response/CartResponse.dart';

import '../../../../../../core/colors/colors.dart';
import '../../../../../../core/shared_widget/custom_button.dart';
import '../../../../../../core/text_style/styles.dart';
import 'cart_bottom_sheet.dart';

Widget checkoutButton(context,List<CartItems> cartItems)=>Material(
  elevation: 1,
  child: Container(
    margin: EdgeInsets.only(bottom: 80.h),
    height: 85.h,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14)),

    ),
    child: Padding(
      padding: EdgeInsetsDirectional.only(top: 7.h, start: 20.w,end: 20.w),
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
                showModalBottomSheet(context: context, builder: (context)=>CartBottomSheet(context,cartItems),);
              },
              style: Styles.textStyle16.copyWith(color: Colors.white,fontWeight: FontWeight.w600)
          ),
        ],
      ),
    ),
  ),
);