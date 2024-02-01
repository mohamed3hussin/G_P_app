import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/features/product_details/product_details_view.dart';

import '../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../core/text_style/styles.dart';

Widget WishListItemBuilder(context)=>InkWell(
  onTap: (){Navigator.pushNamed(context, ProductDetailsView.routeName);},
  child: Material(
    borderRadius: BorderRadius.circular(12),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 1,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Image(
              image: NetworkImage('https://img.freepik.com/free-photo/portrait-man-white-shirt_171337-11986.jpg'),
              width: double.infinity,

            ),
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: ()
                {},
                icon: CircleAvatar(
                  radius: 20.w,
                  backgroundColor: Colors.grey[200],
                  child: Icon(
                    IconBroken.Heart,
                    color:Color(0xFFEA3A3D),
                    size: 30.w,
                  ),
                )),
          ],
        ),
        SizedBox(height: 5.h,),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 15.w,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'S705 T-Shirt',
                  style: Styles.textStyle14.copyWith(color: CustomColors.textColor,fontWeight: FontWeight.w500)
              ),
              SizedBox(height: 5.h,),
              Row(
                children: [
                  Text(
                      '\$ ${120.00}',
                      style: Styles.textStyle16.copyWith(color: CustomColors.green,fontWeight: FontWeight.w600)
                  ),
                  SizedBox(width: 2.w,),
                  Text(
                    '\$ ${180.00}',
                    style: Styles.textStyle12.copyWith(color: Colors.grey,decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
              SizedBox(height: 5.h,),

            ],
          ),
        ),
      ],
    ),
  ),
);