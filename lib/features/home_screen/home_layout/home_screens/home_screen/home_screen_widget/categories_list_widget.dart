import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/text_style/styles.dart';

Widget CategoriesListWidget(CategoriesModel model)=>Column(
  children: [
    Stack(
      alignment: AlignmentDirectional.center,
      children: [
        CircleAvatar(
          radius: 48.0,
          backgroundColor: Colors.black,
        ),
        CircleAvatar(
          radius: 47.0,
          backgroundColor: Colors.white,
        ),
        CircleAvatar(
          radius: 45.0,
          backgroundImage: AssetImage(model.image),
          backgroundColor: Colors.grey[300],
        ),
      ],
    ),
    SizedBox(height: 5.h,),
    Text(
      '${model.title}',
      style: Styles.textStyle14.copyWith(color: Color(0xFF001C38),fontWeight: FontWeight.w500),
    ),
  ],
);
class CategoriesModel
{
  final String image;
  final String title;


  CategoriesModel(this.image, this.title);
}