import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import '../../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../../core/text_style/styles.dart';

class ChangePasswordField extends StatefulWidget {
  bool isObscure=false;
  String fieldName;
  TextEditingController textEditController;
  ChangePasswordField(this.fieldName,this.textEditController, {super.key});

  @override
  State<ChangePasswordField> createState() => _ChangePasswordFieldState();
}

class _ChangePasswordFieldState extends State<ChangePasswordField> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.fieldName,style: Styles.textStyle14.copyWith(color: Colors.black),),
        SizedBox(height: 15.h,),
        TextFormField(
          validator: (value)
          {
            if(value!.isEmpty && value.trim().isEmpty)
            {

              return 'Field must not empty!';
            }
            bool passValid = RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                .hasMatch(value);
            if (!passValid) {
              return 'Enter a valid password!';
            } else {
              return null;
            }

          },
          obscureText: widget.isObscure,
          controller: widget.textEditController,
          decoration: InputDecoration(
              suffixIcon: GestureDetector(onTap: (){ widget.isObscure=!widget.isObscure;setState(() {

              });},child:  widget.isObscure?Icon(IconBroken.Hide,color: CustomColors.blue,size: 30,):Icon(IconBroken.Show,color: CustomColors.blue,size: 30,)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide:const BorderSide(color: Colors.black),
              )
          ),
        ),
      ],
    );
  }
}
