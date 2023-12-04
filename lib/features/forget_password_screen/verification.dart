import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/helper/hundel_size.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/forget_password_screen/new_password.dart';

import 'custom_page_route.dart';

class VerificationView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: context.deviceHeight / 3,
                width: context.deviceWidth / 2,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    color: Color(0xFFEFF1F8),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100.r),
                        bottomRight: Radius.circular(100.r))),
                child: Center(
                    child: Image.asset(
                        AssetsData.happyRobotRaisingHand)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24.r),
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(AssetsData.indicator2,height: 8.h,width: 48.w,),
              ),
            ),
            SizedBox(
              height: 64.h,
            ),
            Text(
              'Check Your Phone',
              style: Styles.textStyle24,
            ),
            Padding(
              padding: EdgeInsets.all(8.r),
              child: Text("We've Sent The Code To Your Phone",
                  style: Styles.textStyle14),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: OtpTextField(
                focusedBorderColor: Color(0XFF1B72C0),
                fieldWidth: 60.w,
                numberOfFields: 4,
                borderRadius: BorderRadius.circular(8.r),
                showFieldAsBox: true,
                onSubmit: (String verificationCode){
                  Navigator.push(
                    context,
                    CustomPageRoute(child: NewPasswordView()),
                  );
                }, // end onSubmit
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(right:8.w),
                child: TextButton(
                    onPressed: () {},
                    child: Text('Send again',
                        style: Styles.textStyle14!.copyWith(
                          color: Color(0XFF1B72C0),fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
