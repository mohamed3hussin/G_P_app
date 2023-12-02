import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/shared_widget/custom_button.dart';
import 'package:g_p_app/core/text_style/styles.dart';

class SignUpButton extends StatelessWidget {
  final formKey;

  const SignUpButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: true,
      builder:(context)=>Center(
        child: CustomButton(
          width: double.infinity,
          height: 50.h,
          backgroundColor: Color(0xFF1B72C0),
          text: 'Sign Up',
          func: () {
            if(formKey.currentState!.validate())
            {

            }
          }, style:Styles.textStyle20.copyWith(fontSize: 24,color: Colors.white),
        ),
      ),
      fallback:(context)=>Center(child: CircularProgressIndicator()) ,
    );
  }
}
