import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/colors/colors.dart';
import '../../../../../../core/text_style/styles.dart';
import '../../../../../../data/model/response/CartResponse.dart';

Widget CheckoutSelectedProduct(List<CartItems> cartItems)=>SizedBox(
    width: double.infinity,
    height: 400.h,
    child: ListView.separated(
        itemBuilder: ((context, index) => CheckoutList(cartItems[index])),
        separatorBuilder: ((context, index) => SizedBox(height: 5.h,)),
        itemCount: cartItems.length)
);

Widget CheckoutList(CartItems cartItems)=>Material(
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
            image: NetworkImage(cartItems.pictureUrl??''),
            width: 80.w,
            height: 80.h,
            fit:BoxFit.cover,
          ),
          SizedBox(width: 10.w,),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartItems.productName??'',
                style: Styles.textStyle14.copyWith(color: CustomColors.textColor,fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5.h,),
              Text(
                'Size : ${cartItems.size}',
                style: Styles.textStyle14,
              ),
              Text(
                  '\$ ${cartItems.price}',
                  style: Styles.textStyle16.copyWith(color: CustomColors.green,fontWeight: FontWeight.w600)
              ),
            ],
          )),
          Column(
            children: [
              Text('${cartItems.quantity} item',style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600,color: CustomColors.darkGrey)),
            ],
          ),
        ],
      ),
    ),
  ),
);