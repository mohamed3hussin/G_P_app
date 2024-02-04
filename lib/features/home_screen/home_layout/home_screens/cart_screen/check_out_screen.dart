import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/iconBroken.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'cart-widget/check_out_addrees.dart';
import 'cart-widget/check_out_confirm_payment.dart';
import 'cart-widget/check_out_pay_cash.dart';
import 'cart-widget/check_out_pay_credit.dart';
import 'cart-widget/check_out_selected_product.dart';

class CheckOutScreen extends StatefulWidget {
  static const String routeName='check_out_screen';

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  String groupValue='' ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.h,
        backgroundColor: Color(0xFFEFF1F8),
        leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(IconBroken.Arrow___Left_2,color: CustomColors.blue,),),
        title: Text('Checkout'),
        titleTextStyle: Styles.textStyle24.copyWith(color: CustomColors.darkBlue,fontWeight: FontWeight.w700),
        centerTitle: true,
        actions:
        [
          IconButton(onPressed: (){}, icon: Icon(IconBroken.Search,color: Color(0xFF1B72C0),size: 30,)),
          IconButton(onPressed: (){}, icon: Icon(IconBroken.Buy,color: Color(0xFF1B72C0),size: 30,))
        ],
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w,vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text('Delivery Address',style: Styles.textStyle16.copyWith(color: CustomColors.textColor,fontWeight: FontWeight.w600),)),
              SizedBox(height: 15.h,),
              CheckoutAddrees(),
              SizedBox(height: 20.h,),
              Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text('Selected Product',style: Styles.textStyle16.copyWith(color: CustomColors.textColor,fontWeight: FontWeight.w600),)),
              SizedBox(height: 15.h,),
              CheckoutSelectedProduct(),
              SizedBox(height: 15.h,),
              Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text('Payment Method',style: Styles.textStyle16.copyWith(color: CustomColors.textColor,fontWeight: FontWeight.w600),)),
              SizedBox(height: 15.h,),
              CheckoutPayCredit(groupValue),
              SizedBox(height: 10.h,),
              CheckoutPayCash(groupValue),
              SizedBox(height: 30.h,),
              CheckoutConfirmPayment(context),
            ],
          ),
        ),
      ),
    );
  }


}
