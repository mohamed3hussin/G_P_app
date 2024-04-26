import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/home_screen/home_screen.dart';
import '../../data/model/response/login_response.dart';
import '../dialog_utils/dialog_utils.dart';
import '../home_screen/home_layout/home_layout.dart';
import 'loginCubit/loginCubit.dart';
import 'loginCubit/loginState.dart';
import 'login_widget/create_account_line.dart';
import 'login_widget/forget_password.dart';
import 'login_widget/login_body.dart';
import 'login_widget/login_button.dart';
import 'login_widget/login_text.dart';
import 'login_widget/login_with_line.dart';

class LoginScreenView extends StatefulWidget {
  static const String routeName = 'login_view';

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>LoginScreenViewCubit(),
        child: BlocConsumer<LoginScreenViewCubit,LoginStates>
          (
          listener: (context,state)
          {
            // if(state is LoginSuccessState)
            // {
            //   Navigator.pushReplacementNamed(context, HomeLayout.routeName);
            // }
          },
          builder: (context,state)
          {
            var cubit = LoginScreenViewCubit.get(context);
            return Scaffold(
              backgroundColor: Color(0xFFFCFCFF),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const loginText(),
                        SizedBox(height: 30),
                        loginBody(
                          formKey: formKey,
                          emailController: emailController,
                          passwordController: passwordController,
                        ),
                        const ForgetPassword(),
                        SizedBox(height: 20),
                        LoginButton(
                          state: state,
                          func: ()
                          {
                            if(formKey.currentState!.validate())
                            {
                              // cubit.UserLogin(email: emailController.text, password: passwordController.text);
                              Navigator.pushReplacementNamed(context, HomeLayout.routeName);
                            }
                          },),

                        SizedBox(height: 40),
                        const loginWithLine(),
                        SizedBox(height: 25),
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
