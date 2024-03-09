import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';

class SearchField extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 15.h),
      height: 80.h,
      child: TextFormField(
        cursorHeight: 30.h,
        decoration: InputDecoration(
          label: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Search here',style: Styles.textStyle14,),
                Icon(Icons.search),
              ],
            ),
          ),
          hintText: 'Search here',
          hintStyle: Styles.textStyle14,
          filled: true,
          fillColor: CustomColors.lightGrey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: CustomColors.grey)
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: CustomColors.lightGrey)
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never, // Keep the label fixed

        ),
      ),
    );
  }
}
