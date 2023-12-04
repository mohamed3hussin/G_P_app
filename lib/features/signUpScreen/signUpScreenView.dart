import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/assets_data/iconBroken.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/signUpScreen/registerCubit/signUpCubit.dart';
import 'package:g_p_app/features/signUpScreen/registerCubit/signUpState.dart';
import 'package:g_p_app/features/signUpScreen/sign_up_widget/confirm_password_line.dart';
import 'package:g_p_app/features/signUpScreen/sign_up_widget/email_line.dart';
import 'package:g_p_app/features/signUpScreen/sign_up_widget/full_name_line.dart';
import 'package:g_p_app/features/signUpScreen/sign_up_widget/have_account_line.dart';
import 'package:g_p_app/features/signUpScreen/sign_up_widget/password_line.dart';
import 'package:g_p_app/features/signUpScreen/sign_up_widget/sign_up_button.dart';
import 'package:g_p_app/features/signUpScreen/sign_up_widget/sign_up_with_line.dart';

class SignUpScreenView extends StatelessWidget {

  static const String routeName='signup_screen_view';
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  SignUpScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>SignUpCubit(),
      child: BlocConsumer<SignUpCubit,SignUpState>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            backgroundColor: Color(0xFFFCFCFF),
            appBar: AppBar(
              leading: IconButton(onPressed: () { Navigator.pop(context); }, icon:Icon(IconBroken.Arrow___Left_2),),
              title: Text('Sign Up',style: Styles.textStyle24.copyWith(color: Color(0xFF001C38),fontWeight: FontWeight.w700),),
              centerTitle: true,
              actions: [
                Padding(
                  padding:  EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                  child: Container(
                      height: 18.h,
                      child: Image(
                          image: AssetImage(AssetsData.loginImage))),
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w,vertical: 20.h),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FullNameLine(nameController:nameController,),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      EmailLine(emailController: emailController,),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      PasswordLine(passwordController:passwordController,formKey: formKey),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      ConfirmPasswordLine(confirmPasswordController: confirmPasswordController,formKey: formKey,),
                      SizedBox(
                        height: 40.0.h,
                      ),
                      SignUpButton(formKey:formKey),
                      SizedBox(
                        height: 40.0.h,
                      ),
                      const SignUpWithLine(),
                      SizedBox(
                        height: 30.0.h,
                      ),
                      const HaveAccountLine(),
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
