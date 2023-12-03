import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/helper/hundel_size.dart';

import '../../../../../core/text_style/styles.dart';

class NoItemView extends StatelessWidget {
  const NoItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/images/shopping-cart.png',height: 150.sp,width: 150.sp,),
        Padding(
          padding: EdgeInsets.only(top: 46.sp, bottom: 86.sp),
          child: Center(
            child: Text(
              'No Item',
              style: Styles.textStyle24!.copyWith(color: Color(0xFF1B72C0)),
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: context.deviceWidth*0.09),
            width: context.deviceWidth * 0.7,
            height: context.deviceHeight * 0.06,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Start Shopping',
                style: Styles.textStyle16!.copyWith(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1B72C0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.sp),
                  )),
            ))
      ],
    );
  }
}
