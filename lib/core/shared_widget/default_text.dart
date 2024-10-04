import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';

Widget defaultTextField({
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
  Color border = Colors.white,
  double radius = 10,
}) =>
    TextFormField(
      onTap: tap,
      onFieldSubmitted: fieldSubmitted ,
      enabled: enable,
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        floatingLabelStyle: const TextStyle(color: Color(0xFF270008)),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        hintText: hint,
        hintStyle: Styles.textStyle14.copyWith(color: CustomColors.grey,fontWeight: FontWeight.w400),
        prefixIcon: prefix != null? Icon(prefix,color: const Color(0xFF001E2F),) : null,
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
          borderRadius: BorderRadius.circular(radius.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(radius.r)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: border, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(radius.r)),
        ),
      ),
      keyboardType: type,
      onChanged: onChange,
      validator: validate,
    );