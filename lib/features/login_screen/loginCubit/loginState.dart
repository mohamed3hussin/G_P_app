import 'package:g_p_app/data/model/response/login_response.dart';

abstract class LoginStates{}

class LoginInitialState extends LoginStates{}

class LoginPasswordChange extends LoginStates{}
class LoginLoadingState extends LoginStates{
  String? loadingMsg;

  LoginLoadingState({this.loadingMsg});
}
class LoginErrorState extends LoginStates{
  String? errorMsg;

  LoginErrorState({this.errorMsg});
}
class LoginSuccessState extends LoginStates{
  LoginResponse response;

  LoginSuccessState({required this.response});
}