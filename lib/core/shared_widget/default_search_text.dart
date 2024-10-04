import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/text_style/styles.dart';

Widget defaultSearchTextField({
  TextEditingController? controller,
  required TextInputType type,
  Function(String)? onChange,
  FormFieldValidator? validate,
  String? label,
  String? hint,
  IconData? prefix,
  bool isObscure = false,
  IconData? suffix,
  Function()? pressed,
  Function()? tap,
  Function(String)? fieldSubmitted ,
  bool? enable,
  Color background = const Color(0xFF001C38) ,
  double radius = 10,
}) =>
    SizedBox(
      width: 220.w,
      height: 40.h,
      child: TextFormField(
        onTap: tap,
        onFieldSubmitted: fieldSubmitted ,
        enabled: enable,
        controller: controller,
        obscureText: isObscure,
        decoration: InputDecoration(
          floatingLabelStyle: const TextStyle(color: Color(0xFF270008)),
          labelText: label,
          labelStyle: Styles.textStyle16.copyWith(color: const Color(0xFf44474E),fontWeight: FontWeight.w400),
          hintText: hint,
          prefixIcon: prefix != null? Icon(prefix,color: const Color(0xFF44474E),) : null,
          suffixIcon: suffix != null
              ? IconButton(
            onPressed: pressed,
            icon: Icon(
              suffix,
              color: background,
            ),
          )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius.sp),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(radius.sp)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF74777F), width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(radius.sp)),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF74777F), width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(radius.sp)),
          ),
        ),
        keyboardType: type,
        onChanged: onChange,
        validator: validate,
      ),
    );