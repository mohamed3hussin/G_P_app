import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/login_screen/loginCubit/loginCubit.dart';
import 'package:g_p_app/features/login_screen/loginCubit/loginState.dart';
import 'package:g_p_app/features/login_screen/login_widget/login_body.dart';
import 'package:g_p_app/features/login_screen/login_widget/login_text.dart';

import 'login_widget/create_account_line.dart';
import 'login_widget/forget_password.dart';
import 'login_widget/login_button.dart';
import 'login_widget/login_with_line.dart';


class LoginScreenView extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  LoginScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> LoginCubit() ,
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state)
        {},
        builder: (context,state)
        {
          return Scaffold(
            backgroundColor: Color(0xFFFCFCFF),
            body: Padding(
              padding:  EdgeInsetsDirectional.symmetric(horizontal: 20.w,vertical: 25.h),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children:
                    [
                      const loginText(),
                      SizedBox(
                        height: 30.0.h,
                      ),
                      loginBody(formKey: formKey,emailController: emailController,passwordController: passwordController,),
                      const ForgetPassword(),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      LoginButton(formKey: formKey),
                      SizedBox(
                        height: 40.0.h,
                      ),
                      const loginWithLine(),
                      SizedBox(
                        height: 25.0.h,
                      ),
                      const createAccount(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
