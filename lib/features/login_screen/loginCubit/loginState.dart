import 'package:g_p_app/data/model/response/login_response.dart';

abstract class LoginStates{}

class LoginInitialState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates
{
  final LoginSuccessResponse userModel;

  LoginSuccessState(this.userModel);
}
class LoginErrorState extends LoginStates
{
  final String error;

  LoginErrorState(this.error);
}
class LoginShowPasswordState extends LoginStates{}