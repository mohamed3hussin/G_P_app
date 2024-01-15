import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/iconBroken.dart';
import 'package:g_p_app/core/colors/colors.dart';
import '../../../../../../../../core/assets_data/assetsData.dart';
import '../../../../../../../../core/text_style/styles.dart';

class ReturnOrderAlert extends StatelessWidget {
  const ReturnOrderAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 530.h,
      width: 325.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(IconBroken.Close_Square,color: CustomColors.blue,size: 30,),
              ],
            ),
            Image.asset(
              AssetsData.robotCalls,
              height: 210.h,
              width: 215.w,
            ),
            Center(
              child: Text(
                'Thank you for contacting us',
                textAlign: TextAlign.center,
                style: Styles.textStyle20.copyWith(color: CustomColors.blue),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: 250.w,
              child: Text(
                'Our customer service team will contact you within 24 hours at the latest. ',
                style: Styles.textStyle14.copyWith(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 280.w,
                height: 55.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: CustomColors.blue,
                ),
                child: Center(
                  child: Text(
                    'Back to Home Page',
                    style: Styles.textStyle16!.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
    ;
  }
}
