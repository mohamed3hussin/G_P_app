import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/shared_widget/custom_button.dart';
import '../../../../core/text_style/styles.dart';
import '../loginCubit/loginState.dart';

class LoginButton extends StatelessWidget {
  final void Function() func;
  final state;
  const LoginButton({super.key, required this.func, this.state});

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: state is! LoginLoadingState,
      builder: (context) => Center(
        child: CustomButton(
          width: double.infinity,
          height: 50.h,
          backgroundColor: const Color(0xFF1B72C0),
          text: 'Log in',
          func: func,
          style: Styles.textStyle20.copyWith(color: Colors.white),
        ),
      ),
      fallback: (context) => const Center(child: CircularProgressIndicator()),
    );
  }
}
