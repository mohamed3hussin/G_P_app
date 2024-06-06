import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_cubit.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_state.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/change_password/change_passowrd_field.dart';
import '../../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../../core/colors/colors.dart';
import '../../../../../../../core/text_style/styles.dart';
import '../account_screen.dart';

class ChangePasswordView extends StatefulWidget {
  static const String routeName = 'new_password';

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  var formKey = GlobalKey<FormState>();

  TextEditingController oldPasswordController = TextEditingController();

  TextEditingController newPasswordController = TextEditingController();

  TextEditingController confirmNewPasswordController = TextEditingController();
@override
  void dispose() {
    // TODO: implement dispose
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return BlocListener<HomeCubit, HomeState>(
      bloc: cubit,
      listener: (BuildContext context, HomeState state) {
        if (state is ChangePasswordError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Center(
                  child: Text(
                'Password is not correct!',
                style: Styles.textStyle16.copyWith(color: Colors.white),
              )),
              backgroundColor: CustomColors.red,
            ),
          );
        }
        if (state is ChangePasswordLoading) {
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

        if (state is ChangePasswordSuccess) {
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
          // Navigate to the home screen
          Future.delayed(Duration(seconds: 3), () {
            Navigator.pushReplacementNamed(
                context, AccountScreen.routeName);
          });
        }

      },
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(IconBroken.Arrow___Left),
          ),
          leadingWidth: 40.w,
          title: Text(
            'Change Password',
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.r),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ChangePasswordField('Old password', oldPasswordController),
                  SizedBox(
                    height: 24.h,
                  ),
                  ChangePasswordField('New password', newPasswordController),
                  SizedBox(
                    height: 24.h,
                  ),
                  ChangePasswordField(
                      'Confirm password', confirmNewPasswordController),
                  SizedBox(
                    height: 24.h,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          cubit.changePassword(
                              currentPassword: oldPasswordController.text,
                              newPassword: confirmNewPasswordController.text,);
                        }
                      },
                      child: Container(
                        width: 330.w,
                        height: 55.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: CustomColors.blue,
                        ),
                        child: Center(
                          child: Text(
                            'Update Password',
                            style:
                                Styles.textStyle20.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
