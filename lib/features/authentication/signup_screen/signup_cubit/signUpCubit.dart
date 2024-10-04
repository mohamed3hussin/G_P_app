import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_p_app/data/api/api_manager.dart';
import 'package:g_p_app/data/model/response/register_response.dart';
import 'package:g_p_app/features/authentication/signup_screen/signup_cubit/signUpState.dart';

import '../../../../data/model/response/AddressResponse.dart';


class SignUpCubit extends Cubit<SignUpState>{
  SignUpCubit():super(SignUpInitialState());

  static SignUpCubit get(context)=> BlocProvider.of(context);

  bool isPasswordShow = true;
  void PasswordShowed()
  {
    isPasswordShow = !isPasswordShow;
    emit(SignUpPasswordChange());
  }
  bool isConfirmPasswordShow = true;
  void ConfirmPasswordShow()
  {
    isConfirmPasswordShow = !isConfirmPasswordShow;
    emit(SignUpConfirmPasswordChange());
  }
  void userRegister({
    required String name,
    required String email,
    required String password,
  }) {
    emit(RegisterLoadingState());
    ApiManager.postData(
      url: 'accounts/Register',
      data: RegisterRequest(displayName: name,email: email, password: password).toJson(),
    ).then((value) {
      final response = RegisterSuccessResponse.fromJson(value.data);
      emit(RegisterSuccessState(response));
    }).catchError((error) {
      final response = ErrorResponse.fromJson(error.response.data);
      emit(RegisterErrorState(response.message));
    });
  }
}