import 'package:flutter/material.dart';
import 'package:g_p_app/core/text_style/styles.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: TextButton(

        onPressed: () {},
        child: Text('Forget Password ?',style: Styles.textStyle12.copyWith(color: Color(0xFF44474E)),),),
    );
  }
}
