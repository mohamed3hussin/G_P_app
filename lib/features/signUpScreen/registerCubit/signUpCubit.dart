import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_p_app/data/api/api_manager.dart';
import 'package:g_p_app/features/signUpScreen/registerCubit/signUpState.dart';

import '../../../data/model/response/login_response.dart';


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

  LoginUserModel? model;
  void UserRegister({
    required String name,
    // required String phone,
    required String email,
    required String password,
  })
  {
    emit(RegisterLoadingState());
    ApiManager.postData(
        url: 'register',
        data:
        {
          'name':name,
          // 'phone':phone,
          'email':email,
          'password':password,
        }).then((value) {
      model= LoginUserModel.fromJson(value.data);
      // print(model!.status);
      //print(model!.message);
      //print(model!.data!.token);
      emit(RegisterSuccessState(model!));
    }).catchError((error)
    {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }
}