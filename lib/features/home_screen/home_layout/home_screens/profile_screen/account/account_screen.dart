import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/address/select_address_view.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/phone/phone_number_view.dart';
import '../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../core/colors/colors.dart';
import '../profile_item.dart';
import 'my_order/my_orders_view.dart';

class AccountScreen extends StatelessWidget {
  static const String routeName = 'account_screen';

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
          child: Icon(IconBroken.Arrow___Left_2,color: CustomColors.blue,),
        ),
        leadingWidth: 40.w,
        title: Center(
            child: Text(
          'Account',
          style: Styles.textStyle24,
        )),
        titleSpacing: 4,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 35.h,
            ),
            ProfileItem(
                icon: IconBroken.User, text: 'E-mail', arrowIcon: false),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, PhoneNumberView.routeName);
                },
                child:
                    ProfileItem(icon: IconBroken.Call, text: 'Phone number')),
            ProfileItem(icon: IconBroken.Setting, text: 'Change number'),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, MyOrdersView.routeName);
                },
                child: ProfileItem(icon: IconBroken.Call, text: 'My orders')),
            GestureDetector(onTap: (){Navigator.pushNamed(context, SelectAddressView.routeName);},child: ProfileItem(icon: Icons.question_mark, text: 'Address')),
            ProfileItem(
              icon: IconBroken.Danger,
              text: 'Delete Account',
              arrowIcon: false,
            ),
          ],
        ),
      ),
    );
  }
}
