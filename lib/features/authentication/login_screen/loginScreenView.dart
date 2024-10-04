import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/cache_helper/cache_helper.dart';
import '../../../core/colors/colors.dart';
import '../../../core/text_style/styles.dart';
import '../../home_screen/home_layout/home_layout.dart';
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

  const LoginScreenView({super.key});

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  @override
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
            if(state is LoginSuccessState)
            {
              CacheHelper.saveData(key: 'role', value: state.userModel.roles);
              CacheHelper.saveData(key: 'token', value: "Bearer ${state.userModel.token}").then((value) => {
              Navigator.pushReplacementNamed(context, HomeLayout.routeName)
              });
            }
            if (state is LoginErrorState){
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Center(child: Text("${state.error}!",style: Styles.textStyle16,)),
                    backgroundColor: CustomColors.red,
                  ),
                );
              });
            }
          },
          builder: (context,state)
          {
            var cubit = LoginScreenViewCubit.get(context);
            return Scaffold(
              backgroundColor: const Color(0xFFFCFCFF),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const loginText(),
                        const SizedBox(height: 30),
                        loginBody(
                          formKey: formKey,
                          emailController: emailController,
                          passwordController: passwordController,
                        ),
                        const ForgetPassword(),
                        const SizedBox(height: 20),
                        LoginButton(
                          state: state,
                          func: ()
                          {
                            if(formKey.currentState!.validate())
                            {
                              cubit.userLogin(email: emailController.text, password: passwordController.text);
                            }
                          },),

                        const SizedBox(height: 40),
                        const loginWithLine(),
                        const SizedBox(height: 25),
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
