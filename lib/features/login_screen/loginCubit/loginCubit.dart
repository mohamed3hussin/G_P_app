import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_p_app/data/api/api_manager.dart';
import 'package:g_p_app/data/model/response/login_response.dart';
import 'package:g_p_app/features/login_screen/loginCubit/loginState.dart';

class LoginScreenViewCubit extends Cubit<LoginStates>
{
  LoginScreenViewCubit():super(LoginInitialState());
  static LoginScreenViewCubit get(context)=>BlocProvider.of(context);

  bool isPasswordShow = true;
  void PasswordShowed()
  {
    isPasswordShow = !isPasswordShow;
    emit(LoginShowPasswordState());
  }





  LoginUserModel? model;
  void UserLogin({
    required String email,
    required String password,
  })
  {

    emit(LoginLoadingState());
    ApiManager.postData(
        url: 'login',
        data:
        {
          'email':email,
          'password':password,
        }).then((value) {
      model= LoginUserModel.fromJson(value.data);
      // print(model!.status);
      //print(model!.message);
      //print(model!.data!.token);
      emit(LoginSuccessState(model!));
    }).catchError((error)
    {
      print('=======================================================');
      print(error.toString());
      print('=======================================================');
      emit(LoginErrorState(error.toString()));
    });
  }



}