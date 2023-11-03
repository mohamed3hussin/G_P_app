import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/helper/hundel_size.dart';
import 'package:g_p_app/features/onBoarding_screen/onBoarding_view.dart';

import '../../core/text_style/styles.dart';

class splashView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Column(
          children:
          [
            Image.asset(AssetsData.splashImage),
            SizedBox(height: context.deviceHeight/50,),
            Text('AI Shop',
              style: Styles.textStyle24,
            ),
          ],
        ),
        nextScreen: onBoardingView(),
        splashIconSize: 300.sp,
        duration: 4000,
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Color(0xFFC299A2),




    );
  }
}
