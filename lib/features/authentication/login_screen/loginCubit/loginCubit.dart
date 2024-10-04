import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_p_app/data/api/api_manager.dart';
import 'package:g_p_app/data/model/response/login_response.dart';

import '../../../../core/cache_helper/cache_helper.dart';
import 'loginState.dart';


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

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    ApiManager.postData(
      url: 'accounts/Login',
      data: LoginRequest(email: email, password: password).toJson(),
    ).then((value) {
      final response = LoginSuccessResponse.fromJson(value.data);
      CacheHelper.saveData(key: 'username', value: response.displayName);
      CacheHelper.saveData(key: 'email', value: response.email);
      emit(LoginSuccessState(response));
    }).catchError((error) {
      final response = ErrorResponse.fromJson(error.response.data);
      emit(LoginErrorState(response.message));
      });
  }

}