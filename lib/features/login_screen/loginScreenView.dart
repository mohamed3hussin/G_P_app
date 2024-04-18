import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/response/login_response.dart';
import '../dialog_utils/dialog_utils.dart';
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
  LoginScreenViewModel viewModel =
      LoginScreenViewModel(loginResponse: LoginResponse());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => viewModel,
      child: Scaffold(
        backgroundColor: Color(0xFFFCFCFF),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: SingleChildScrollView(
            child: BlocConsumer<LoginScreenViewModel, LoginStates>(
              listener: (context, state) {
                if (state is LoginLoadingState) {
                  DialogUtils.showLoading(context, 'Waiting');
                }
                else if (state is LoginErrorState) {
                  DialogUtils.hideLoading(context);
                  DialogUtils.showMessage(context, state.errorMsg ?? '');
                }
                else if (state is LoginSuccessState) {
                  DialogUtils.hideLoading(context);
                  DialogUtils.showMessage(context, state.response.displayName?? '');
                }
              },
              builder: (context, state) {
                return Column(
                  children: [
                    const loginText(),
                    SizedBox(height: 30),
                    loginBody(
                      formKey: viewModel.formKey,
                      emailController: viewModel.emailController,
                      passwordController: viewModel.passwordController,
                    ),
                    const ForgetPassword(),
                    SizedBox(height: 20),
                    LoginButton(
                      func: (){
                        viewModel.login();
                      },
                    ),

                    SizedBox(height: 40),
                    const loginWithLine(),
                    SizedBox(height: 25),
                    const createAccount(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
