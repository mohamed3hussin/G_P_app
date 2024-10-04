import 'package:flutter/material.dart';
import 'package:g_p_app/core/text_style/styles.dart';

import '../../signup_screen/signUpScreenView.dart';


class createAccount extends StatelessWidget {
  const createAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
        Text('Don\'t have an account?',style: Styles.textStyle16.copyWith(color: const Color(0xFF44474E)),),
        TextButton(
          onPressed: ()
          {
            Navigator.pushNamed(context, SignUpScreenView.routeName);
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
