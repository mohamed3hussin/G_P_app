import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/assets_data/iconBroken.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/authentication/signup_screen/signup_cubit/signUpCubit.dart';
import 'package:g_p_app/features/authentication/signup_screen/signup_cubit/signUpState.dart';
import 'package:g_p_app/features/authentication/signup_screen/signup_widget/email_line.dart';
import 'package:g_p_app/features/authentication/signup_screen/signup_widget/full_name_line.dart';
import 'package:g_p_app/features/authentication/signup_screen/signup_widget/have_account_line.dart';
import 'package:g_p_app/features/authentication/signup_screen/signup_widget/password_line.dart';
import 'package:g_p_app/features/authentication/signup_screen/signup_widget/sign_up_button.dart';
import 'package:g_p_app/features/authentication/signup_screen/signup_widget/sign_up_with_line.dart';

import '../login_screen/loginScreenView.dart';

class SignUpScreenView extends StatefulWidget {
  static const String routeName = 'signup_screen_view';

  const SignUpScreenView({super.key});

  @override
  State<SignUpScreenView> createState() => _SignUpScreenViewState();
}

class _SignUpScreenViewState extends State<SignUpScreenView> {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            Navigator.pushReplacementNamed(context, LoginScreenView.routeName);
          }
          if (state is RegisterErrorState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Center(
                      child: Text(
                    state.error,
                    style: Styles.textStyle16,
                  )),
                  backgroundColor: CustomColors.red,
                ),
              );
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xFFFCFCFF),
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(IconBroken.Arrow___Left_2),
              ),
              title: Text(
                'Sign Up',
                style: Styles.textStyle24.copyWith(
                    color: const Color(0xFF001C38),
                    fontWeight: FontWeight.w700),
              ),
              centerTitle: true,
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                  child: SizedBox(
                      height: 18.h,
                      child: const Image(
                          image: AssetImage(AssetsData.loginImage))),
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 10.w, vertical: 20.h),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FullNameLine(
                        nameController: nameController,
                      ),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      EmailLine(
                        emailController: emailController,
                      ),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      PasswordLine(
                          passwordController: passwordController,
                          confirmPasswordController: confirmPasswordController,
                          formKey: formKey),
                      SizedBox(
                        height: 40.0.h,
                      ),
                      SignUpButton(
                        state: state,
                        func: () {
                          if (formKey.currentState!.validate()) {
                            SignUpCubit.get(context).userRegister(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                      ),
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
