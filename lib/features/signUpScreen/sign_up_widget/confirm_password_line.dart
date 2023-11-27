import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/assets_data/iconBroken.dart';
import '../../../core/shared_widget/default_text.dart';
import '../registerCubit/signUpCubit.dart';

class ConfirmPasswordLine extends StatelessWidget {
  final confirmPasswordController;
  final formKey;

  const ConfirmPasswordLine({super.key, required this.confirmPasswordController, required this.formKey});
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10.sp),
      child: defaultTextField(
        controller: confirmPasswordController,
        type: TextInputType.visiblePassword,
        label: 'Confirm Password',
        prefix: IconBroken.Lock,
        suffix: SignUpCubit.get(context).isConfirmPasswordShow? IconBroken.Show:IconBroken.Hide,
        validate: (value)
        {
          if(value!.isEmpty)
          {

            return 'Confirm Password most not empty';
          }
          else{
            return null;}
        },
        pressed: ()
        {
          SignUpCubit.get(context).ConfirmPasswordShow();
        },
        fieldSubmitted: (value)
        {
          if(formKey.currentState!.validate())
          {

          }
        },
        isObscure: SignUpCubit.get(context).isConfirmPasswordShow,

      ),
    );
  }
}
