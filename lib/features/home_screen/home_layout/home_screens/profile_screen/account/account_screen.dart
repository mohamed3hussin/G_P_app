import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/address/edit_address_view.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/change_password/change_password_view.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/my_order/past_order/past_orders_view.dart';
import '../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../core/cache_helper/cache_helper.dart';
import '../../../../../../core/colors/colors.dart';
import '../profile_item.dart';

class AccountScreen extends StatelessWidget {
  static const String routeName = 'account_screen';

  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.h,
        backgroundColor: const Color(0xFFEFF1F8),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            IconBroken.Arrow___Left_2,
            color: CustomColors.blue,
          ),
        ),
        leadingWidth: 40.w,
        title: Text(
                  'Account',
                  style: Styles.textStyle24,
                ),
        titleSpacing: 4,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 35.h,
            ),
            ProfileItem(
                icon: IconBroken.User, text: 'Username', description: CacheHelper.getData(key: 'username'),arrowIcon: false),
            ProfileItem(
                icon: IconBroken.Message, text: 'E-mail',description: CacheHelper.getData(key: 'email'), arrowIcon: false),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ChangePasswordView.routeName);
                },
                child: ProfileItem(
                    icon: IconBroken.Setting, text: 'Change password')),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, PastOrdersView.routeName);
                },
                child: ProfileItem(icon: IconBroken.Call, text: 'My orders')),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, EditAddressView.routeName);
                },
                child: ProfileItem(icon: Icons.question_mark, text: 'Edit address')),
          ],
        ),
      ),
    );
  }
}
