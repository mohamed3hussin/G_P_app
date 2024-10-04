import 'package:flutter/material.dart';
import 'package:g_p_app/core/text_style/styles.dart';

class HaveAccountLine extends StatelessWidget {
  const HaveAccountLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
        Text('Already have an account?',style: Styles.textStyle16.copyWith(color: const Color(0xFF44474E)),),
        TextButton(
          onPressed: ()
          {
            Navigator.pop(context);
          },
          child: Text(
            'Log in',
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w700,color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
