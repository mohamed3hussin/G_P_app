import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';

class AddAddressField extends StatelessWidget {
  String fieldTitle;

  AddAddressField(this.fieldTitle);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(fieldTitle,style: Styles.textStyle16,),
        SizedBox(height: 16.h,),
        SizedBox(
          height: 55.h,
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r,),
                borderSide: BorderSide(color: CustomColors.lightGrey),
              )
            ),
          ),
        ),
        SizedBox(height: 24.h,)
      ],
    );
  }
}
