import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import '../../../../../core/assets_data/assetsData.dart';
import '../../../../../core/text_style/styles.dart';

class SignOutAlert extends StatelessWidget {
  const SignOutAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsData.sadRobotImage,
            ),
            Center(
              child: Text(
                'Want To Logout Now?',
                textAlign: TextAlign.center,
                style: Styles.textStyle24.copyWith(color: Colors.black),
              ),
            ),
            SizedBox(
              width: 250.w,
              child: Text(
                'You will back to early app if you click the logout button',
                style: Styles.textStyle14.copyWith(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20.h,
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
                    'Cancel',
                    style: Styles.textStyle20!.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
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
                  border: Border.all(color: Color(0xFF74777F)),
                  color: Colors.transparent,
                ),
                child: Center(
                  child: Text(
                    'Log out',
                    style: Styles.textStyle20!.copyWith(
                      color: Color(0xFF74777F),
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFF74777F),
                      decorationThickness: 1.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
