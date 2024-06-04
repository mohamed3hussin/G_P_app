import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';

class EditAddressField extends StatelessWidget {
  String fieldTitle;
  String initValue;
  TextEditingController textEditController;
  EditAddressField(this.fieldTitle,this.initValue,this.textEditController);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(fieldTitle,style: Styles.textStyle16,),
        SizedBox(height: 8.h,),
        SizedBox(
          child: TextFormField(
              validator: (value)
              {
                if(value!.isEmpty)
                {

                  return 'Field must not empty!';
                }
                else{
                  return null;}

            },
            style: Styles.textStyle16,
            controller: textEditController,
            decoration: InputDecoration(
              hintText: initValue,
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding: EdgeInsets.only(bottom: 5.h,left: 15.w),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r,),
                borderSide: BorderSide(color: CustomColors.lightGrey),
              )
            ),
          ),
        ),
        SizedBox(height: 12.h,)
      ],
    );
  }
}
