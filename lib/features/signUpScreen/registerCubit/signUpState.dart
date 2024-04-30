import 'package:g_p_app/data/model/response/login_response.dart';
import 'package:g_p_app/data/model/response/register_response.dart';

abstract class SignUpState{}

class SignUpInitialState extends SignUpState{}

class SignUpPasswordChange extends SignUpState{}
class SignUpConfirmPasswordChange extends SignUpState{}
class RegisterLoadingState extends SignUpState{}
class RegisterSuccessState extends SignUpState
{
  final RegisterSuccessResponse model;

  RegisterSuccessState(this.model);
}
class RegisterErrorState extends SignUpState
{
  final String error;

  RegisterErrorState(this.error);
}