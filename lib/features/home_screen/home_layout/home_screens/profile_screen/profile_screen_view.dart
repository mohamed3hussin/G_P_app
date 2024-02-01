import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/iconBroken.dart';
import 'package:g_p_app/features/design_screens/design_explain_screen1.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/account_screen.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/payment_method/payment_view.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/settings/settings_view.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/signout_alert.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/profile_item.dart';

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
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, PaymentView.routeName);
              },
              child: ProfileItem(
                  icon: Icons.payment_rounded, text: 'Payment Method')),
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, SettingsView.routeName);
              },
              child: ProfileItem(icon: IconBroken.Setting, text: 'Settings')),
          ProfileItem(icon: IconBroken.Call, text: 'Customer service'),
          ProfileItem(icon: Icons.question_mark, text: 'About us'),
          GestureDetector(onTap: (){Navigator.pushNamed(context, DesignExplainScreenOne.routeName);},child: ProfileItem(icon: IconBroken.Danger, text: 'Our Features')),
          GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    child: SignOutAlert(),
                  ),
                );
              },
              child: ProfileItem(icon: IconBroken.Logout, text: 'Sign out')),
        ],
      ),
    );
  }
}
