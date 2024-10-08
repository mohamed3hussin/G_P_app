import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/text_style/styles.dart';

Widget CollectionList(CollectionModel model,bool isSelected)=>Column(
  children: [
    Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          decoration: ShapeDecoration(shape: OvalBorder(side: isSelected?const BorderSide(color: Colors.black,width: 2):const BorderSide(color: Colors.white))),
          child: CircleAvatar(
            radius: 45.0,
            backgroundImage: AssetImage(model.image),
            backgroundColor: Colors.grey[300],
          ),
        ),
      ],
    ),
    SizedBox(height: 5.h,),
    Text(
      model.title,
      style: Styles.textStyle14.copyWith(color: const Color(0xFF001C38),fontWeight: FontWeight.w500),
    ),
  ],
);
class CollectionModel
{
  final String image;
  final String title;
  CollectionModel(this.image, this.title);
}