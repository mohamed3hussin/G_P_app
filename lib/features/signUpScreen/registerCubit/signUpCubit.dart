import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_p_app/features/signUpScreen/registerCubit/signUpState.dart';


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
}