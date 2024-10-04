import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/assets_data/assetsData.dart';
import '../../../../core/colors/colors.dart';
import '../../../../core/text_style/styles.dart';
import '../../home_layout/home_layout.dart';

class AddedToCartAlert extends StatelessWidget {
  const AddedToCartAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 520.h,
      width: 325.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Image.asset(
                AssetsData.robotWithHeart,height:210.h,width: 215.w,
              ),
            ),
            SizedBox(height: 35.h,),
            Center(
              child: Text(
                'The product has been added to cart ',
                textAlign: TextAlign.center,
                style: Styles.textStyle20.copyWith(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacementNamed(context, HomeLayout.routeName);
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
                    'Continue Shopping',
                    style: Styles.textStyle16.copyWith(color: Colors.white),
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
                  border: Border.all(color: const Color(0xFF74777F)),
                  color: Colors.transparent,
                ),
                child: Center(
                  child: Text(
                    'Close',
                    style: Styles.textStyle16.copyWith(
                      color: const Color(0xFF74777F),
                      decoration: TextDecoration.underline,
                      decorationColor: const Color(0xFF74777F),
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

  }
}
