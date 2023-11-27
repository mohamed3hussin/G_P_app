import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/shared_widget/default_text.dart';

class EmailLine extends StatelessWidget {
  final emailController;

  const EmailLine({super.key, required this.emailController});
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10.sp),
      child: defaultTextField(
        type: TextInputType.emailAddress,
        controller: emailController,
        label: 'Email',
        prefix: Icons.email,
        validate: (value)
        {
          if(value!.isEmpty)
          {

            return 'email most not empty';
          }
          else{
            return null;}
        },
      ),
    );
  }
}
