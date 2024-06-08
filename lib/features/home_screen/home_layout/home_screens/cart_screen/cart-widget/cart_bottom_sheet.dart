import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_cubit.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/cart_screen/check_out_screen.dart';

import '../../../../../../core/colors/colors.dart';
import '../../../../../../core/shared_widget/custom_button.dart';
import '../../../../../../core/text_style/styles.dart';
import '../../../../../../data/model/response/CartResponse.dart';

Widget CartBottomSheet(context,List<CartItems> cartItems) {
  double totalPrice = cartItems.fold(
    0.0,
        (previousValue, cartItem) => previousValue + (cartItem.price! * cartItem.quantity!.toInt()),
  );
  return Container(
      height: 250.h,
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(
            vertical: 10.h, horizontal: 20.w),
        child: Column(
          children: [
            Container(
              height: 120.h,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                itemBuilder: (context, index) =>
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("${cartItems[index].productName}:" ?? '',
                          style: Styles.textStyle16,),
                        Text("\$ ${cartItems[index].price?.toStringAsFixed(2)}",
                          style: Styles.textStyle16,),
                      ],
                    ), itemCount: cartItems.length,),
            ),
            Row(
              children: [
                Text('Total Payment:', style: Styles.textStyle16.copyWith(
                    color: CustomColors.textColor),),
                Spacer(),
                Text("\$ ${totalPrice.toStringAsFixed(2)}", style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w600, color: CustomColors.blue),)
              ],
            ),
            SizedBox(height: 15.h,),
            CustomButton(
                width: double.infinity,
                height: 56.h,
                radius: 12,
                backgroundColor: CustomColors.blue,
                text: 'Checkout Now',
                func: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed(CheckOutScreen.routeName);
                },
                style: Styles.textStyle16.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w600)
            ),
          ],
        ),
      ),
    );
}