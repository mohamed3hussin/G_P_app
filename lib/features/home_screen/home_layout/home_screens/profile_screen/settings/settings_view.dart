import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/profile_item.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/settings/currency_settings_view.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/settings/language_settings_view.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/settings/widgets/profile_item_with_switch.dart';
import '../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../core/colors/colors.dart';
import '../../../../../../core/text_style/styles.dart';

class SettingsView extends StatelessWidget {
  static const String routeName = 'settings_view';

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
          child: Icon(
            IconBroken.Arrow___Left_2,
            color: CustomColors.blue,
          ),
        ),
        leadingWidth: 40.w,
        title: Center(
            child: Text(
          'Settings',
          style: Styles.textStyle24,
        )),
        titleSpacing: 4,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 30.h,),
          ProfileItemWithSwitch(icon: Icons.brightness_6, text: 'Dark Mood',),
          ProfileItemWithSwitch(icon: Icons.notifications, text: 'Notification',),
          GestureDetector(onTap: (){Navigator.pushNamed(context, LanguageSettingsView.routeName);},child: ProfileItem(icon: Icons.language, text: 'Language')),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, CurrencySettingsView.routeName);},child: ProfileItem(
              icon: Icons.monetization_on_outlined,
              text: 'currency',
            ),
          ),
        ],
      ),
    );
  }
}
