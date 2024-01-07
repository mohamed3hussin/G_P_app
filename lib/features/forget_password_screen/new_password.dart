import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/assets_data/iconBroken.dart';
import 'package:g_p_app/core/helper/hundel_size.dart';
import 'package:g_p_app/core/shared_widget/default_text.dart';
import 'package:g_p_app/core/text_style/styles.dart';

class NewPasswordView extends StatefulWidget {
  static const String routeName='new_password_view';

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  var npformKey = GlobalKey<FormState>();

  TextEditingController _passwordController = TextEditingController();

  TextEditingController _confirmPasswordController = TextEditingController();
  // @override
  // void dispose() {
  //   super.dispose();
  //   _passwordController.dispose();
  //   _confirmPasswordController.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: npformKey,
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 250.h,
                  width: 180.w,
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                      color: Color(0xFFEFF1F8),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100.r),
                          bottomRight: Radius.circular(100.r))),
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(AssetsData.staringRobot,width: 90.w,height: 180.h,),
                  )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.h),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AssetsData.indicator3,
                    height: 8.h,
                    width: 48.w,
                  ),
                ),
              ),
              SizedBox(
                height: 64.h,
              ),
              Text(
                'New Password',
                style: Styles.textStyle24,
              ),
              Padding(
                padding: EdgeInsets.all(8.r),
                child: Text(
                  'Enter Your New Password',
                  style: Styles.textStyle14,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10.r),
                  child: defaultTextField(
                    controller: _passwordController,
                    type: TextInputType.text,
                    isObscure: true,
                      label: 'Password',
                      prefix: IconBroken.Lock,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10.r),
                  child: defaultTextField(
                    controller: _confirmPasswordController,
                    type: TextInputType.text,
                    isObscure: true,
                      label: 'Confirm Password',
                      prefix: IconBroken.Lock,

                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: context.deviceHeight * 0.05,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: EdgeInsets.all(16.r),
                  height: context.deviceHeight * 0.06,
                  width: context.deviceWidth * 0.16,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(8),
                      backgroundColor: Color(0XFF1B72C0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                    onPressed: () {
                      if (npformKey.currentState!.validate()) {
                        print('Passwords match!');
                      }
                    },
                    child: Icon(
                      IconBroken.Arrow___Right_2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
