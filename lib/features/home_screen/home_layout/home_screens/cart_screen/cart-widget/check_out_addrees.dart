import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../core/colors/colors.dart';
import '../../../../../../core/text_style/styles.dart';

Widget CheckoutAddrees()=>SizedBox(
  width: double.infinity,
  child: Material(
    borderRadius: BorderRadius.circular(12),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 1,
    child: Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w,vertical: 10.h),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: CustomColors.lightPink,
                    borderRadius: BorderRadius.circular(6),

                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 7.w,vertical: 2.h),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children:
                      [
                        Icon(IconBroken.Home),
                        Text('Home',style: Styles.textStyle12.copyWith(fontWeight: FontWeight.w600,color: CustomColors.darkTextColor),)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),
                Text('Alexander Michael',style: Styles.textStyle14.copyWith(color: CustomColors.textColor,fontWeight: FontWeight.w600),),
                SizedBox(height: 15.h,),
                SizedBox(
                    width: 190.w,
                    child: Text('Pangandaran Brick Street No. 690445434 Yogya, Central Java',maxLines: 2,overflow: TextOverflow.ellipsis,style: Styles.textStyle12,)),
                SizedBox(height: 15.h,),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: (){}, child: Text('Change',style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600,color: CustomColors.darkGrey))),
            ],
          )
        ],
      ),
    ),
  ),
);