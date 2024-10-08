import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/iconBroken.dart';
import 'package:g_p_app/core/shared_widget/default_text.dart';

import '../loginCubit/loginCubit.dart';

class loginBody extends StatelessWidget {
  final emailController;

  final passwordController;
  final formKey;

  const loginBody({super.key, this.emailController, this.passwordController, this.formKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(10.sp),
          child: defaultTextField(
            type: TextInputType.emailAddress,
            controller: emailController,
            label: 'User Name',
            prefix: IconBroken.Profile,
            validate: (value) {
              if (value!.isEmpty) {
                return 'Email must not empty';
              }
              bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value);
              if (!emailValid) {
                return 'Enter a valid email!';
              }
              return null;
            },
          ),
        ),
        SizedBox(
          height: 15.0.h,
        ),
        Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(10.sp),
          child: defaultTextField(
            controller: passwordController,
            type: TextInputType.visiblePassword,
            label: 'password',
            prefix: IconBroken.Lock,
            suffix: LoginScreenViewCubit.get(context).isPasswordShow
                ? IconBroken.Show
                : IconBroken.Hide,
            validate: (value) {
              if (value!.isEmpty) {
                return 'Password must not empty';
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
            pressed: () {
              LoginScreenViewCubit.get(context).PasswordShowed();
            },
            fieldSubmitted: (value) {
              if (formKey.currentState!.validate()) {}
            },
            isObscure: LoginScreenViewCubit.get(context).isPasswordShow,
          ),
        ),
      ],
    );
  }
}
