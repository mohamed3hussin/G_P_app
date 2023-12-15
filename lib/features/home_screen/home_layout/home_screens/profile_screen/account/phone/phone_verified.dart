import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';

import '../../../../../../../core/assets_data/iconBroken.dart';

class PhoneVerifiedView extends StatelessWidget {
  static const String routeName = 'phone_verified';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            children: [
              SizedBox(height: 95.h,),
              Image.asset(AssetsData.robotCalls),
              Text(
                'Phone Number Verified',
                style: Styles.textStyle24!.copyWith(color: CustomColors.blue),
              ),
              Padding(
                padding:EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  'You will be redirected to the main page in a few moments',
                  style: Styles.textStyle14,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
