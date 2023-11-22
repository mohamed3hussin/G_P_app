import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_p_app/features/login_screen/loginCubit/loginState.dart';

class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit():super(LoginInitialState());
  static LoginCubit get(context)=>BlocProvider.of(context);

  bool isPasswordShow = true;
  void PasswordShowed()
  {
    isPasswordShow = !isPasswordShow;
    emit(LoginPasswordChange());
  }
}