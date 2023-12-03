import 'package:flutter/material.dart';
import 'package:g_p_app/core/shared_widget/custom_navigation.dart';
import 'package:g_p_app/core/text_style/styles.dart';

import '../../forget_password_screen/forget_password_view.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: TextButton(

        onPressed: ()
        {
          NavigationTo(context, ForgetPasswordView());
        },
        child: Text('Forget Password ?',style: Styles.textStyle12.copyWith(color: Color(0xFF44474E)),),),
    );
  }
}
