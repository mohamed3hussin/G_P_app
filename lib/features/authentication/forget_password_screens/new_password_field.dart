import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/assets_data/iconBroken.dart';
import '../../../core/shared_widget/default_text.dart';


class NewPasswordField extends StatefulWidget {
  bool isObscure;
  String label;
  var controller;
  var validate;
  var onpressed;
  NewPasswordField({super.key, required this.label,required this.validate,required this.controller,required this.isObscure,required this.onpressed});

  @override
  State<NewPasswordField> createState() => _NewPasswordFieldState();
}

class _NewPasswordFieldState extends State<NewPasswordField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10.r),
        child: defaultTextField(
          controller: widget.controller,
          type: TextInputType.text,
          isObscure: widget.isObscure,
          pressed: widget.onpressed,
          suffix: widget.isObscure?IconBroken.Hide:IconBroken.Show,
          label: widget.label,
          prefix: IconBroken.Lock,
          validate: widget.validate
        ),
      ),
    );
  }
}
