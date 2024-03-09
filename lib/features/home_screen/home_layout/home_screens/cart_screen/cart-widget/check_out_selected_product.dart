import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/colors/colors.dart';
import '../../../../../../core/text_style/styles.dart';

Widget CheckoutSelectedProduct()=>SizedBox(
    width: double.infinity,
    height: 120.h,
    child: ListView.separated(
        itemBuilder: ((context, index) => CheckoutList()),
        separatorBuilder: ((context, index) => SizedBox(height: 5.h,)),
        itemCount: 5)
);

Widget CheckoutList()=>Material(
  borderRadius: BorderRadius.circular(12),
  clipBehavior: Clip.antiAliasWithSaveLayer,
  elevation: 1,
  child: Container(
    child: Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 6),
      child: Row(
        children: [
          SizedBox(width: 10.w,),
          Image(
            image: NetworkImage('https://img.freepik.com/free-photo/portrait-man-white-shirt_171337-11986.jpg'),
            width: 80.w,
            height: 80.h,
            fit:BoxFit.cover,
          ),
          SizedBox(width: 10.w,),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Orlando Watch',
                style: Styles.textStyle14.copyWith(color: CustomColors.textColor,fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5.h,),
              Text(
                'Size : ${12}',
                style: Styles.textStyle14,
              ),
              Text(
                  '\$ ${230}',
                  style: Styles.textStyle16.copyWith(color: CustomColors.green,fontWeight: FontWeight.w600)
              ),
            ],
          )),
          Column(
            children: [
              Text('${1} item',style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600,color: CustomColors.darkGrey)),
            ],
          ),
        ],
      ),
    ),
  ),
);