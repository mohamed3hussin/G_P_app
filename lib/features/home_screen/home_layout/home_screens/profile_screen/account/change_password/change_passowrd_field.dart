import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import '../../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../../core/text_style/styles.dart';

class ChangePasswordField extends StatefulWidget {
  bool isObscure=false;
  String fieldName;

  ChangePasswordField(this.fieldName);

  @override
  State<ChangePasswordField> createState() => _ChangePasswordFieldState();
}

class _ChangePasswordFieldState extends State<ChangePasswordField> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.fieldName,style: Styles.textStyle14!.copyWith(color: Colors.black),),
        SizedBox(height: 15.h,),
        TextFormField(
          obscureText: widget.isObscure,
          decoration: InputDecoration(
              suffixIcon: GestureDetector(onTap: (){ widget.isObscure=!widget.isObscure;setState(() {

              });},child:  widget.isObscure?Icon(IconBroken.Hide,color: CustomColors.blue,size: 30,):Icon(IconBroken.Show,color: CustomColors.blue,size: 30,)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide:BorderSide(color: Colors.black),
              )
          ),
        ),
      ],
    );
  }
}
