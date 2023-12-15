import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/iconBroken.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/account_screen.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/signout_alert.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/profile_item.dart';

import '../../../../../core/assets_data/assetsData.dart';
import '../../../../../core/shared_widget/custom_button.dart';
import '../../../../login_screen/loginScreenView.dart';

class ProfileScreenView extends StatelessWidget {
  const ProfileScreenView({super.key});

  static const String routeName = 'profile_view';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              height: 64.h,
              width: 64.h,
              margin: EdgeInsets.only(
                  left: 110.w, right: 110.w, top: 20.h, bottom: 15.h),
              child: CircleAvatar(
                backgroundColor: CustomColors.lightGrey,
              )),
          Text(
            'Username',
            textAlign: TextAlign.center,
            style: Styles.textStyle16,
          ),
          SizedBox(
            height: 25.h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, AccountScreen.routeName);
            },
            child: ProfileItem(
              icon: IconBroken.User,
              text: 'My Account',
            ),
          ),
          ProfileItem(icon: Icons.payment_rounded, text: 'Payment Method'),
          ProfileItem(icon: IconBroken.Setting, text: 'Settings'),
          ProfileItem(icon: IconBroken.Call, text: 'Customer service'),
          ProfileItem(icon: Icons.question_mark, text: 'About us'),
          ProfileItem(icon: IconBroken.Danger, text: 'Our Features'),
          GestureDetector(
              onTap: () {
                showAlertDialog(context);
              },
              child: ProfileItem(icon: IconBroken.Logout, text: 'Sign out')),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: FractionallySizedBox(
            widthFactor: 0.85, // Adjust the width factor as needed
            heightFactor: 0.7, // Adjust the height factor as needed
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 2,
                    child: Image.asset(
                      AssetsData.sadRobotImage,
                      width: 160.w,
                      height: 256.h,
                    )),
                Text(
                  'Want to Logout Now?',
                  textAlign: TextAlign.center,
                  style: Styles.textStyle24,
                ),
                Text(
                  'You will be taken back to the early app if you click the logout button',
                  textAlign: TextAlign.center,
                  style: Styles.textStyle14,
                ),
              ],
            ),
          ),
          actions: [
            Column(
              children: [
                CustomButton(
                  width: 280.w,
                  backgroundColor: Colors.white,
                  text: 'Cancel',
                  func: () {
                    Navigator.pop(context);
                  },
                  style: Styles.textStyle16,
                ),
                SizedBox(height: 10.h,),
                CustomButton(
                  width: 280.w,
                  backgroundColor: CustomColors.blue,
                  text: 'Log Out',
                  func: () {
                    Navigator.pushNamed(context, LoginScreenView.routeName);
                  },
                  style: Styles.textStyle16!.copyWith(color: Colors.white),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
