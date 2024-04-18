import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_p_app/data/api/api_manager.dart';
import 'package:g_p_app/data/model/response/login_response.dart';
import 'package:g_p_app/features/login_screen/loginCubit/loginState.dart';

class LoginScreenViewModel extends Cubit<LoginStates>
{
  LoginResponse loginResponse;
  LoginScreenViewModel({required this.loginResponse}):super(LoginInitialState());
  static LoginScreenViewModel get(context)=>BlocProvider.of(context);

  bool isPasswordShow = true;
  void PasswordShowed()
  {
    isPasswordShow = !isPasswordShow;
    emit(LoginPasswordChange());
  }
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  bool isObscure = true;

  login() async {
      emit(LoginLoadingState());
      final response = await ApiManager.login(emailController.text, passwordController.text);
      if (response != null && response.statusCode == 200) {
        emit(LoginSuccessState(response: response));
      } else {
        emit(LoginErrorState(errorMsg: response?.message ?? ''));
      }
    }


}