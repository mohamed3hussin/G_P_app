import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/shared_widget/custom_button.dart';
import 'package:g_p_app/core/shared_widget/custom_navigation.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_layout.dart';
import 'package:g_p_app/features/test.dart';

import '../../../core/text_style/styles.dart';

class LoginButton extends StatelessWidget {
  final formKey;

  const LoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: true,
      builder: (context) => Center(
        child: CustomButton(
          width: double.infinity,
          height: 50.h,
          backgroundColor: const Color(0xFF1B72C0),
          text: 'Log in',
          func: () {
            if (formKey.currentState!.validate()) {
              Navigator.pushNamedAndRemoveUntil(context, HomeLayout.routeName,(route)=>false);
            }
          },
          style: Styles.textStyle20.copyWith(fontSize: 24, color: Colors.white),
        ),
      ),
      fallback: (context) => const Center(child: CircularProgressIndicator()),
    );
  }
}
