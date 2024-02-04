import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/colors/colors.dart';
import '../../../../../../core/shared_widget/custom_button.dart';
import '../../../../../../core/text_style/styles.dart';
import '../order_success.dart';

Widget CheckoutBottomSheet(context)=>Container(
  height: 200.h,
  child: Padding(
    padding: EdgeInsetsDirectional.symmetric(vertical: 10.h,horizontal: 20.w),
    child: Column(
      children: [
        Row(
          children: [
            Text('Subtotal (${2} items):',
              style: Styles.textStyle12.copyWith
                (color: CustomColors.grey,fontWeight: FontWeight.w400),),
            Spacer(),
            Text('\$${250.00}',
              style: Styles.textStyle16.copyWith
                (color: CustomColors.darkGrey,fontWeight: FontWeight.w400),),
          ],
        ),
        Row(
          children: [
            Text('Delivery cost:',
              style: Styles.textStyle12.copyWith
                (color: CustomColors.grey,fontWeight: FontWeight.w400),),
            Spacer(),
            Text('\$${20}',style: Styles.textStyle16.copyWith(color: CustomColors.darkGrey),)
          ],
        ),
        Text('--------------------------------------------',style: Styles.textStyle12.copyWith(color: CustomColors.grey),),
        Row(
          children: [
            Text('Total Payment',style: Styles.textStyle16.copyWith(color: CustomColors.textColor),),
            Spacer(),
            Text('\$${250}',style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600,color: CustomColors.blue),)
          ],
        ),
        SizedBox(height: 20.h,),
        CustomButton(
            width: double.infinity,
            height: 56.h,
            radius: 12,
            backgroundColor: CustomColors.blue,
            text: 'Confirm Payment',
            func:()
            {
              Navigator.pop(context);
              showDialog(
                  context: context,
                  builder:(context)
                  {
                    return Dialog(
                      child: OrderSuccessView(),
                    );
                  });
            },
            style: Styles.textStyle16.copyWith(color: Colors.white,fontWeight: FontWeight.w600)
        ),
      ],
    ),
  ),
);