import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

import '../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../core/colors/colors.dart';
import '../../../../../../core/text_style/styles.dart';

class PaymentView extends StatelessWidget {
  static const String routeName = 'payment_View';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.h,
        backgroundColor: Color(0xFFEFF1F8),
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},icon: Icon(IconBroken.Arrow___Left_2,color: CustomColors.blue,),),
        title: Text('Payment Methods'),
        titleTextStyle: Styles.textStyle24.copyWith(color: CustomColors.darkBlue,fontWeight: FontWeight.w700),
        centerTitle: true,

      ),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w,vertical: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  'Choose Payment Methods',
                  style: Styles.textStyle16.copyWith(
                      color: CustomColors.darkBlue,
                      fontWeight: FontWeight.w600),)),
            SizedBox(height: 30.h,),
            Container(
              height: 65.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color:CustomColors.lightGrey
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(vertical: 5.h,horizontal: 15.w),
                child: Row(
                  children: [
                    Icon(Icons.payment,color: CustomColors.blue,),
                    SizedBox(width: 10,),
                    Text(
                      'Debit/Credit Card',
                      style: Styles.textStyle16.copyWith(
                          color: CustomColors.darkBlue,
                          fontWeight: FontWeight.w500
                      ),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.h,),
            Container(
              height: 65.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color:CustomColors.lightGrey
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(vertical: 5.h,horizontal: 15.w),
                child: Row(
                  children: [
                    Icon(Icons.paypal_outlined,color: CustomColors.blue,),
                    SizedBox(width: 10,),
                    Text(
                      'Paypal',
                      style: Styles.textStyle16.copyWith(
                          color: CustomColors.darkBlue,
                          fontWeight: FontWeight.w500
                      ),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.h,),
            Container(
              height: 65.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color:CustomColors.lightGrey
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.symmetric(vertical: 5.h,horizontal: 15.w),
                child: Row(
                  children: [
                    Icon(Icons.apple,color: CustomColors.blue,),
                    SizedBox(width: 10,),
                    Text(
                      'Apple Pay',
                      style: Styles.textStyle16.copyWith(
                          color: CustomColors.darkBlue,
                          fontWeight: FontWeight.w500
                      ),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            Container(
              child: InkWell(
                onTap: (){

                },
                child: Container(
                  height: 60.h,
                  decoration: BoxDecoration(
                      border: DashedBorder.fromBorderSide(
                          dashLength: 5, side: BorderSide(color: Color(0xFF74777F), width: 2)),
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.add,color: Color(0xFF74777F)),
                      SizedBox(width: 10.w,),
                      Text('Add Another Option',style: Styles.textStyle16.copyWith(color: Color(0xFF74777F)),),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
