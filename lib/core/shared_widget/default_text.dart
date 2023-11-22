import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget defaultTextField({
  // final String? Function(String?)? validator,
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
    TextFormField(
      onTap: tap,
      onFieldSubmitted: fieldSubmitted ,
      enabled: enable,
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(color: Color(0xFF270008)),
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey),
        hintText: hint,
        prefixIcon: prefix != null? Icon(prefix,color: Color(0xFF001E2F),) : null,
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
          borderSide: BorderSide(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(radius.sp)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(radius.sp)),
        ),
      ),
      keyboardType: type,
      onChanged: onChange,
      validator: validate,
    );