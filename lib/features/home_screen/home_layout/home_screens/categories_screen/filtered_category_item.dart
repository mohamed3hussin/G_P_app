import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import '../../../../../core/assets_data/iconBroken.dart';
import '../../../../../core/text_style/styles.dart';

Widget FilteredCategoryItemBuilder(String image,context)=>Material(
  elevation: 1,
  borderRadius: BorderRadius.circular(12.r),
  child: Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r),border: Border.all(color: Colors.black,width: 1)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(image: AssetImage(AssetsData.saleLogo),width: 30.w,height: 30.h,),
            ),
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Center(
                  child: Image(
                    image: AssetImage(image),
                    height: 145.h,
                  ),
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
          ],
        ),
        SizedBox(height: 5.h,),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'T-Shirt',
                  style: Styles.textStyle12.copyWith(color: Color(0xFF1B72C0),fontWeight: FontWeight.w500)
              ),
              SizedBox(height: 3.h,),
              Text(
                  'EGP 480',
                  style: Styles.textStyle14.copyWith(color: Colors.black,fontWeight: FontWeight.w500)
              ),
              Row(
                children: [
                  Text(
                    'EGP 600',
                    style: Styles.textStyle12.copyWith(color: Colors.grey,decoration: TextDecoration.lineThrough),
                  ),
                  SizedBox(width: 2.w,),
                  Text(
                      '20% OFF',
                      style: Styles.textStyle14.copyWith(color: Color(0xFF117828),fontWeight: FontWeight.w500)
                  ),
                ],
              ),
              Row(
                children:
                [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      CircleAvatar(
                        radius: 6.0.w,
                        backgroundColor: Colors.black,

                      ),
                      CircleAvatar(
                        radius: 5.0.w,
                        backgroundColor: Colors.white,

                      ),
                    ],
                  ),
                  SizedBox(width: 3.w,),
                  CircleAvatar(
                    radius: 6.0.w,
                    backgroundColor: Colors.blueAccent,

                  ),
                  SizedBox(width: 3.w,),
                  CircleAvatar(
                    radius: 6.0.w,
                    backgroundColor: Colors.amber,

                  ),
                  SizedBox(width: 3.w,),
                  CircleAvatar(
                    radius: 6.0.w,
                    backgroundColor: Colors.green,

                  ),

                ],
              ),
              Row(
                children: [
                  Icon(Icons.star,color: Colors.amber,),
                  SizedBox(width: 2.w,),
                  Text('4.5',style: Styles.textStyle12.copyWith(color: Colors.black,fontWeight: FontWeight.w400),),
                  SizedBox(width: 2.w,),
                  Text('(72)',style: Styles.textStyle12.copyWith(color: Colors.black,fontWeight: FontWeight.w400),),
                  Spacer(),
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: ()
                      {},
                      icon: CircleAvatar(
                        radius: 20.w,
                        backgroundColor: Color(0xFF1B72C0),
                        child: Icon(
                          IconBroken.Bag_2,
                          color:Colors.white,
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);