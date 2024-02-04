import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/colors/colors.dart';
import '../../../../../../core/shared_widget/custom_button.dart';
import '../../../../../../core/text_style/styles.dart';
import 'check_out_bottom_sheet.dart';

Widget CheckoutConfirmPayment(context)=>Column(
  children: [
    CustomButton(
        width: double.infinity,
        height: 56.h,
        radius: 12,
        backgroundColor: CustomColors.blue,
        text: 'Confirm Payment',
        func:()
        {

          showModalBottomSheet(context: context, builder: (context)=>CheckoutBottomSheet(context),);

        },
        style: Styles.textStyle16.copyWith(color: Colors.white,fontWeight: FontWeight.w600)
    ),
  ],
);