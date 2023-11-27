import 'package:flutter/material.dart';
import 'package:g_p_app/core/shared_widget/custom_navigation.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/signUpScreen/signUpScreenView.dart';


class createAccount extends StatelessWidget {
  const createAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
        Text('Don\'t have an account?',style: Styles.textStyle16.copyWith(color: Color(0xFF44474E)),),
        TextButton(
          onPressed: ()
          {
            NavigationTo(context, SignUpScreenView());
          },
          child: Text(
            'Sign Up',
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w700,color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
