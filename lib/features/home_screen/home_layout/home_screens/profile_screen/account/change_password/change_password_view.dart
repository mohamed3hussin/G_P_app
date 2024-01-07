import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/shared_widget/default_text.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/change_password/change_passowrd_field.dart';

import '../../../../../../../core/assets_data/iconBroken.dart';

class ChangePasswordView extends StatelessWidget {
  static const String routeName = 'new_password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(IconBroken.Arrow___Left),
        ),
        leadingWidth: 40.w,
        title: Center(
            child: Text(
          'Change Password',
        )),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChangePasswordField('Old password'),
              SizedBox(height: 24.h,),
              ChangePasswordField('New password'),
              SizedBox(height: 24.h,),
              ChangePasswordField('Confirm password'),
              SizedBox(height: 24.h,),
            ],
          ),
        ),
      ),
    );
  }
}
