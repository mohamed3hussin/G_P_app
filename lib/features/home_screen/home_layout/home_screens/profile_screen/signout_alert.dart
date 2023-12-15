import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/shared_widget/custom_button.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/login_screen/loginScreenView.dart';

class SignOutAlert {
  static void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Image.asset(AssetsData.sadRobotImage),
            content: Container(
              height: 560.h,
              width: 325.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Want to Log Out',
                    style: Styles.textStyle24,
                  ),
                  Text(
                    'You will back to early app if you click the logout button',
                    style: Styles.textStyle14,
                  ),
                ],
              ),
            ),
            actions: [
              CustomButton(
                  backgroundColor: Colors.white,
                  text: 'Cancel',
                  func: (){Navigator.pop(context);},
                  style: Styles.textStyle16),
              CustomButton(
                  backgroundColor: CustomColors.blue,
                  text: 'Log Out',
                  func: (){Navigator.pushNamed(context, LoginScreenView.routeName);},
                  style: Styles.textStyle16),
            ],
          );
        });
  }
}
