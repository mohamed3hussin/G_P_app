import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/data/model/response/CartResponse.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/cart_screen/cart-widget/cart_item_widget.dart';


Widget CartListView(List<CartItems> model)=>Expanded(
  child: Padding(
    padding:  EdgeInsetsDirectional.symmetric(horizontal: 15.w,vertical: 2.h),
    child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context,index)=>CartItemWidget(model[index]),
        separatorBuilder: (context,index)=>SizedBox(height: 12.h,),
        itemCount: model.length),
  ),
);
