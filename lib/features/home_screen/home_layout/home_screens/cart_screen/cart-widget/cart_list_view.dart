import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/colors/colors.dart';
import '../../../../../../core/text_style/styles.dart';

Widget CartListView()=>Expanded(
  child: Padding(
    padding:  EdgeInsetsDirectional.symmetric(horizontal: 15.w,vertical: 2.h),
    child: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context,index)=>CartItem(context),
        separatorBuilder: (context,index)=>SizedBox(height: 12.h,),
        itemCount: 10),
  ),
);
Widget CartItem(context)=>Material(
  borderRadius: BorderRadius.circular(12),
  clipBehavior: Clip.antiAliasWithSaveLayer,
  elevation: 1,
  child: Container(
    child: Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 6),
      child: Row(
        children: [
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
              Row(
                children: [
                  Text(
                      '\$ ${230}',
                      style: Styles.textStyle16.copyWith(color: CustomColors.green,fontWeight: FontWeight.w600)
                  ),
                  Spacer(),
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: ()
                      {},
                      icon: CircleAvatar(
                        radius: 14.r,
                        backgroundColor: CustomColors.lightBlue,
                        child: Icon(
                          Icons.remove,
                        ),
                      )),
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w),
                    child: Text(
                        '1',
                        style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600)
                    ),
                  ),
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: ()
                      {},
                      icon: CircleAvatar(
                        radius: 14.r,
                        backgroundColor: CustomColors.blue,
                        child: Icon(
                          Icons.add,
                          color:Colors.white,
                        ),
                      )),
                ],
              ),
            ],
          )),
        ],
      ),
    ),
  ),
);