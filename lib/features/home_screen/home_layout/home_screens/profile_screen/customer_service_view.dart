import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/assets_data/iconBroken.dart';
import '../../../../../core/colors/colors.dart';
import '../../../../../core/text_style/styles.dart';

class CustomerServiceView extends StatelessWidget {
  static const String routeName='cs_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.h,
        backgroundColor: Color(0xFFEFF1F8),
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},icon: Icon(IconBroken.Arrow___Left_2,color: CustomColors.blue,),),
        title: Text('Customer Service'),
        titleTextStyle: Styles.textStyle24.copyWith(color: CustomColors.darkBlue,fontWeight: FontWeight.w700),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Need help?',style: Styles.textStyle20,),
            Text('Our experts are always ready to support you.',style: Styles.textStyle16,),
            SizedBox(height: 10.h,),
            Container(
              height: 280.h,
              width: 380.w,
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Please call us on:',style: Styles.textStyle20.copyWith(color: CustomColors.blue,fontSize: 18.sp)),
                    SizedBox(height: 10.h,),
                    Row(
                      children: [
                        Icon(IconBroken.Call,color: CustomColors.blue,),
                        SizedBox(width: 10.w,),
                        Text('111',style: Styles.textStyle16.copyWith(decoration: TextDecoration.underline),)
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Row(
                      children: [
                        Icon(IconBroken.Call,color: CustomColors.blue,),
                        SizedBox(width: 10.w,),
                        Text('19777',style: Styles.textStyle16.copyWith(decoration: TextDecoration.underline)),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Row(
                      children: [
                        Icon(IconBroken.Call,color: CustomColors.blue,),
                        SizedBox(width: 10.w,),
                        Text('01555000111',style: Styles.textStyle16.copyWith(decoration: TextDecoration.underline)),
                      ],
                    ),
                    SizedBox(height: 20.h,),
                    Container(
                      width: 380.w,
                      height: 2.h,
                      color: CustomColors.lightGrey,
                    ),
                    SizedBox(height: 10.h,),
                    Text('Or send your inquiry to:',style: Styles.textStyle20.copyWith(color: CustomColors.blue,fontSize: 18.sp)),
                    SizedBox(height: 10.h,),
                    Row(
                      children: [
                        Icon(IconBroken.Message,color: CustomColors.blue,),
                        SizedBox(width: 7.w,),
                        Text('Customer.care@te.eg',style: Styles.textStyle16.copyWith(decoration: TextDecoration.underline),)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
