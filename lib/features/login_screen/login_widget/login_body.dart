import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/iconBroken.dart';
import 'package:g_p_app/core/shared_widget/default_text.dart';
import 'package:g_p_app/features/login_screen/loginCubit/loginCubit.dart';

class loginBody extends StatelessWidget {
  final emailController ;
  final passwordController;
  final formKey;


  loginBody({this.emailController, this.passwordController, this.formKey});

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
            validate: (value)
            {
              if(value!.isEmpty)
              {

                return 'Email most not empty';
              }
              else{
                return null;}
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
            suffix: LoginCubit.get(context).isPasswordShow? IconBroken.Show:IconBroken.Hide,
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
              LoginCubit.get(context).PasswordShowed();
            },
            fieldSubmitted: (value)
            {
              if(formKey.currentState!.validate())
              {

              }
            },
            isObscure: LoginCubit.get(context).isPasswordShow,

          ),
        ),
      ],
    );
  }
}
