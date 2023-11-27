import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/assets_data/iconBroken.dart';
import '../../../core/shared_widget/default_text.dart';
import '../registerCubit/signUpCubit.dart';

class PasswordLine extends StatelessWidget {
  final passwordController;
  final formKey;
  const PasswordLine({super.key, required this.passwordController, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10.sp),
      child: defaultTextField(
        controller: passwordController,
        type: TextInputType.visiblePassword,
        label: 'password',
        prefix: IconBroken.Lock,
        suffix: SignUpCubit.get(context).isPasswordShow? IconBroken.Show:IconBroken.Hide,
        validate: (value)
        {
          if(value!.isEmpty)
          {

            return 'Password most not empty';
          }
          else{
            return null;}
        },
        pressed: ()
        {
          SignUpCubit.get(context).PasswordShowed();
        },
        fieldSubmitted: (value)
        {
          if(formKey.currentState!.validate())
          {

          }
        },
        isObscure: SignUpCubit.get(context).isPasswordShow,

      ),
    );
  }
}
