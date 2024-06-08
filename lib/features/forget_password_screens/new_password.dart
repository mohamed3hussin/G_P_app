import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/assets_data/iconBroken.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/forget_password_screens/new_password_field.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_cubit.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_state.dart';
import 'package:g_p_app/features/login_screen/loginScreenView.dart';
import '../../core/colors/colors.dart';
import 'custom_page_route.dart';
class NewPasswordView extends StatefulWidget {
  static const String routeName = 'new_password_view';

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  var npformKey = GlobalKey<FormState>();

  TextEditingController _passwordController = TextEditingController();

  TextEditingController _confirmPasswordController = TextEditingController();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    var cubit=HomeCubit.get(context);
    return BlocListener(
      bloc: cubit,
      listener: (BuildContext context, state) {
        if (state is ResetPasswordError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Center(
                  child: Text(
                    'Try another password!',
                    style: Styles.textStyle16.copyWith(color: Colors.white),
                  )),
              backgroundColor: CustomColors.red,
            ),
          );
        }
        if (state is ResetPasswordLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(milliseconds: 300),
              content: Center(
                  child: Text(
                    'Waiting...',
                    style: Styles.textStyle16.copyWith(color: Colors.black),
                  )),
              backgroundColor: CustomColors.lightGrey,
            ),
          );
        }
        if(state is ResetPasswordSuccess){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(milliseconds: 2500),
              content: Center(
                  child: Text(
                    'Password updated successfully !',
                    style: Styles.textStyle16
                        .copyWith(color: Colors.white),
                  )),
              backgroundColor: CustomColors.green,
            ),
          );
          Navigator.pushNamed(context, LoginScreenView.routeName);
        }
      },
      child: Scaffold(
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
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        AssetsData.happyRobotRaisingHand,
                        width: 90.w,
                        height: 180.h,
                      ),
                    )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24.h),
                  child: Image.asset(
                    AssetsData.indicator3,
                    height: 8.h,
                    width: 48.w,
                  ),
                ),
                SizedBox(
                  height: 60.h,
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
                NewPasswordField(
                    isObscure: isObscure,
                    onpressed: () {
                      isObscure = !isObscure;
                      setState(() {});
                    },
                    label: 'password',
                    validate: (value) {
                      if (value.isEmpty && value.trim().isEmpty) {
                        return 'Please enter your password';
                      }
                      bool passValid = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                          .hasMatch(value);
                      if (!passValid) {
                        return 'Enter a valid password!';
                      } else {
                        return null;
                      }
                    },
                    controller: _passwordController),

                NewPasswordField(
                  isObscure: isObscure,
                    onpressed: () {
                      isObscure = !isObscure;
                      setState(() {});
                    },
                    label: 'confirm password',
                    validate: (value) {
                      if (value.isEmpty && value.trim().isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      bool passValid = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                          .hasMatch(value);
                      if (!passValid) {
                        return 'Enter a valid password!';
                      } else {
                        return null;
                      }
                    },
                    controller: _confirmPasswordController),
                SizedBox(
                  height: 40.h,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.all(16.r),
                    height: 45.h,
                    width: 60.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(8.r),
                        backgroundColor: Color(0XFF1B72C0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                      onPressed: () {
                        if (npformKey.currentState!.validate()) {
                          cubit.resetPassword(_confirmPasswordController.text);
                        }
                      },
                      child: Icon(
                        IconBroken.Arrow___Right_2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
