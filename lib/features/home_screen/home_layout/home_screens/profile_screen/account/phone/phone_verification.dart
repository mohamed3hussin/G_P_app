import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/phone/phone_verified.dart';

import '../../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../../core/text_style/styles.dart';

class PhoneVerificationView extends StatelessWidget {
  static const String routeName = 'phone_verification';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.h,
        backgroundColor: Color(0xFFEFF1F8),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(IconBroken.Arrow___Left),
        ),
        leadingWidth: 40.w,
        title: Center(
            child: Text(
          'Phone Verification',
          style: Styles.textStyle24,
        )),
        titleSpacing: 4,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 105.h,
          ),
          Container(
            height: 65.h,
            width: 340.w,
            child: Text(
              'Enter 6 digit verification code sent to your phone number',
              style: Styles.textStyle20,
              maxLines: 2,
            ),
          ),
          SizedBox(height: 35.h,),
          OtpTextField(
            focusedBorderColor: Color(0XFF1B72C0),
            fieldWidth: 50.w,
            numberOfFields: 6,
            borderRadius: BorderRadius.circular(8.r),
            showFieldAsBox: true,
            onSubmit: (String verificationCode) {
              Navigator.pushNamed(context, PhoneVerifiedView.routeName);
            }, // end onSubmit
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: TextButton(
                  onPressed: () {},
                  child: Text('Send again',
                      style: Styles.textStyle14!.copyWith(
                        color: Color(0XFF1B72C0),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ))),
            ),
          ),
        ],
      ),
    );
  }
}
