import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/assets_data/iconBroken.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/helper/hundel_size.dart';
import 'package:g_p_app/core/shared_widget/custom_button.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/cart_screen/no_item.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/cart_screen/order_success.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

import '../home_screen/home_screen_widget/product_view_widget.dart';
import 'check_out_screen.dart';

class CartScreen extends StatefulWidget {
  static const String routeName='cart_screen';

   const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding:  EdgeInsetsDirectional.symmetric(horizontal: 15.w,vertical: 2.h),
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index)=>CartItem(context),
                separatorBuilder: (context,index)=>SizedBox(height: 12.h,),
                itemCount: 10),
          ),
        ),

        Material(
          elevation: 1,
          //borderRadius: BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14)),
          child: Container(
            height: 105.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14)),

            ),
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w,vertical: 15.h),
              child: Column(
                children: [

                  CustomButton(
                      width: double.infinity,
                      height: 56.h,
                      radius: 12,
                      backgroundColor: CustomColors.blue,
                      text: 'Checkout Now',
                      func:()
                      {

                       showModalBottomSheet(context: context, builder: (context)=>Container(
                         height: 250.h,
                         child: Padding(
                           padding: EdgeInsetsDirectional.symmetric(vertical: 10.h,horizontal: 20.w),
                           child: Column(
                             children: [
                               Text(
                                 'Selected item:',
                                 style: Styles.textStyle16.copyWith
                                   (fontWeight: FontWeight.w700,
                                     color: CustomColors.grey),),
                               Row(
                                 children: [
                                   Text('Slovy bag:',style: Styles.textStyle12.copyWith(color: CustomColors.grey,fontWeight: FontWeight.w400),),
                                   Spacer(),
                                   Text('\$${240.00}',style: Styles.textStyle16.copyWith(color: CustomColors.darkGrey,fontWeight: FontWeight.w400),)
                                 ],
                               ),
                               Row(
                                 children: [
                                   Text('Orlando Watch',style: Styles.textStyle12.copyWith(color: CustomColors.grey,fontWeight: FontWeight.w400),),
                                   Spacer(),
                                   Text('\$${120}',style: Styles.textStyle16.copyWith(color: CustomColors.darkGrey),)
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
                               SizedBox(height: 15.h,),
                               CustomButton(
                                   width: double.infinity,
                                   height: 56.h,
                                   radius: 12,
                                   backgroundColor: CustomColors.blue,
                                   text: 'Checkout Now',
                                   func:()
                                   {
                                     Navigator.pop(context);
                                     Navigator.of(context).pushNamed(CheckOutScreen.routeName);
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
            ),
          ),
        ),
      ],
    );
  }
  Widget CartItem(context)=>Material(
    borderRadius: BorderRadius.circular(12),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 1,
    child: Container(
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 6),
        child: Row(
          children: [
            ClipRRect(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: SizedBox(
                width: Checkbox.width,
                height: Checkbox.width,
                child: Container(
                  decoration: new BoxDecoration(
                    border: Border.all(
                      width: 1,
                    ),
                    borderRadius: new BorderRadius.circular(5),
                  ),
                  child: Theme(
                    data: ThemeData(
                      unselectedWidgetColor: Colors.transparent,
                    ),
                    child: Checkbox(
                      value: checkBoxValue,
                      onChanged: (state) =>
                          setState(() => checkBoxValue = !checkBoxValue),
                      activeColor: CustomColors.blue,
                      checkColor: Colors.white,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                    ),
                  ),
                ),
              ),
            ),
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
}
