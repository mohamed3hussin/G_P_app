import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_p_app/features/registerScreen/registerCubit/registerState.dart';

class RegisterCubit extends Cubit<RegisterState>{
  RegisterCubit():super(RegisterInitialState());

  static RegisterCubit get(context)=> BlocProvider.of(context);

  bool isPasswordShow = true;
  void PasswordShowed()
  {
    isPasswordShow = !isPasswordShow;
    emit(RegisterPasswordChange());
  }
  bool isConfirmPasswordShow = true;
  void ConfirmPasswordShow()
  {
    isConfirmPasswordShow = !isConfirmPasswordShow;
    emit(RegisterConfirmPasswordChange());
  }
}