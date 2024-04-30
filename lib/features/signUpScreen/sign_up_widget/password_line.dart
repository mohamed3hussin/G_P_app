import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/assets_data/iconBroken.dart';
import '../../../core/shared_widget/default_text.dart';
import '../registerCubit/signUpCubit.dart';

class PasswordLine extends StatelessWidget {
  var passwordController=TextEditingController();
  var confirmPasswordController=TextEditingController();
  final formKey;

  PasswordLine(
      {super.key, required this.passwordController,required this.confirmPasswordController, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(10.sp),
          child: defaultTextField(
            controller: passwordController,
            type: TextInputType.visiblePassword,
            label: 'password',
            prefix: IconBroken.Lock,
            suffix: SignUpCubit.get(context).isPasswordShow
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
              SignUpCubit.get(context).PasswordShowed();
            },
            fieldSubmitted: (value) {
              if (formKey.currentState!.validate()) {}
            },
            isObscure: SignUpCubit.get(context).isPasswordShow,
          ),
        ),
        SizedBox(
          height: 20.0.h,
        ),
        Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(10.sp),
          child: defaultTextField(
            controller: confirmPasswordController,
            type: TextInputType.visiblePassword,
            label: 'Confirm Password',
            prefix: IconBroken.Lock,
            suffix: SignUpCubit.get(context).isConfirmPasswordShow
                ? IconBroken.Show
                : IconBroken.Hide,
            validate: (value) {
              if (value!.isEmpty) {
                return 'confirm password must not empty!';
              }
              if(confirmPasswordController.text!=passwordController.text){
                return 'Password and confirm password do not match!';
              }
              else{
                return null;
              }
            },
            pressed: () {
              SignUpCubit.get(context).ConfirmPasswordShow();
            },
            fieldSubmitted: (value) {
              if (formKey.currentState!.validate()) {}
            },
            isObscure: SignUpCubit.get(context).isConfirmPasswordShow,
          ),
        )
      ],
    );
  }
}
