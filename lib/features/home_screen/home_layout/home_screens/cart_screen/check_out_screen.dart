import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/assets_data/iconBroken.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/cart_screen/order_success.dart';

import '../../../../../core/shared_widget/custom_button.dart';

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
              SizedBox(
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
              ),
              SizedBox(height: 20.h,),
              Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text('Selected Product',style: Styles.textStyle16.copyWith(color: CustomColors.textColor,fontWeight: FontWeight.w600),)),
              SizedBox(height: 15.h,),
              SizedBox(
                width: double.infinity,
                height: 120.h,
                child: ListView.separated(
                    itemBuilder: ((context, index) => CheckoutList()),
                    separatorBuilder: ((context, index) => SizedBox(height: 5.h,)),
                    itemCount: 5)
              ),
              SizedBox(height: 15.h,),
              Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text('Payment Method',style: Styles.textStyle16.copyWith(color: CustomColors.textColor,fontWeight: FontWeight.w600),)),
              SizedBox(height: 15.h,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: CustomColors.darkGrey)
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(vertical: 5.h,horizontal: 5.w),
                  child: Row(
                    children: [
                      Image.asset(AssetsData.creditImage,height: 60,width: 60,),
                      SizedBox(width: 5,),
                      Text(
                        'Credit Card',
                        style: Styles.textStyle16.copyWith(
                            color: CustomColors.textColor,
                            fontWeight: FontWeight.w400
                        ),),
                      Spacer(),
                      Radio(activeColor: CustomColors.darkGrey,value: 'credit', groupValue: groupValue, onChanged: (value)
                      {
                        setState(() {
                          groupValue = value!;
                        });
                      })
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: CustomColors.darkGrey)
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.symmetric(vertical: 5.h,horizontal: 5.w),
                  child: Row(
                    children: [
                      Image.asset(AssetsData.cashImage,height: 60,width: 60,),
                      SizedBox(width: 5,),
                      Text(
                        'Cash',
                        style: Styles.textStyle16.copyWith(
                            color: CustomColors.textColor,
                            fontWeight: FontWeight.w400
                        ),),
                      Spacer(),
                      Radio(activeColor: CustomColors.darkGrey,value: 'cash', groupValue: groupValue, onChanged: (value)
                      {
                        setState(() {
                          groupValue = value!;
                        });
                      })
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.h,),
              Column(
                children: [
                  CustomButton(
                      width: double.infinity,
                      height: 56.h,
                      radius: 12,
                      backgroundColor: CustomColors.blue,
                      text: 'Confirm Payment',
                      func:()
                      {

                        showModalBottomSheet(context: context, builder: (context)=>Container(
                          height: 200.h,
                          child: Padding(
                            padding: EdgeInsetsDirectional.symmetric(vertical: 10.h,horizontal: 20.w),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text('Subtotal (${2} items):',
                                      style: Styles.textStyle12.copyWith
                                        (color: CustomColors.grey,fontWeight: FontWeight.w400),),
                                    Spacer(),
                                    Text('\$${250.00}',
                                      style: Styles.textStyle16.copyWith
                                        (color: CustomColors.darkGrey,fontWeight: FontWeight.w400),),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('Delivery cost:',
                                      style: Styles.textStyle12.copyWith
                                        (color: CustomColors.grey,fontWeight: FontWeight.w400),),
                                    Spacer(),
                                    Text('\$${20}',style: Styles.textStyle16.copyWith(color: CustomColors.darkGrey),)
                                  ],
                                ),
                                Text('--------------------------------------------------',style: Styles.textStyle12.copyWith(color: CustomColors.grey),),
                                Row(
                                  children: [
                                    Text('Total Payment',style: Styles.textStyle16.copyWith(color: CustomColors.textColor),),
                                    Spacer(),
                                    Text('\$${250}',style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600,color: CustomColors.blue),)
                                  ],
                                ),
                                SizedBox(height: 20.h,),
                                CustomButton(
                                    width: double.infinity,
                                    height: 56.h,
                                    radius: 12,
                                    backgroundColor: CustomColors.blue,
                                    text: 'Confirm Payment',
                                    func:()
                                    {
                                      Navigator.pop(context);
                                      showDialog(
                                          context: context,
                                          builder:(context)
                                          {
                                            return Dialog(
                                              child: OrderSuccessView(),
                                            );
                                          });
                                    },
                                    style: Styles.textStyle16.copyWith(color: Colors.white,fontWeight: FontWeight.w600)
                                ),
                              ],
                            ),
                          ),
                        ),);

                      },
                      style: Styles.textStyle16.copyWith(color: Colors.white,fontWeight: FontWeight.w600)
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

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
}
