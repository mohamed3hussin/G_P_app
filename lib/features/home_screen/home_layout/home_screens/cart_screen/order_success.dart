import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/helper/hundel_size.dart';

import '../../../../../core/text_style/styles.dart';

class OrderSuccessView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          AssetsData.successOrderImage,
          height: 245.h,
          width: 245.w,
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(top: 36.h),
          child: Center(
            child: Text(
              'Order Success',
              style: Styles.textStyle24.copyWith(color: Color(0xFF1B72C0),fontWeight: FontWeight.w400),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(top: 5.h, bottom: 60.h),
          child: Center(
            child: Container(
              width: 325.w,
              child: Text(
                'Thank you for your order here and your package will be sent to your address very quickly and fast good product',
                style: Styles.textStyle14.copyWith(color: Colors.black),textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Container(
            margin:
                EdgeInsets.symmetric(horizontal: context.deviceWidth * 0.09),
            width: context.deviceWidth * 0.7,
            height: context.deviceHeight * 0.06,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Continue Shopping',
                style: Styles.textStyle16.copyWith(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1B72C0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  )),
            ))
      ],
    );
  }
}
