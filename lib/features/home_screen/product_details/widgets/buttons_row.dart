import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/shared_widget/custom_button.dart';
import '../../../../core/text_style/styles.dart';
import 'added_to_cart_alert.dart';


class ButtonsRow extends StatelessWidget {
  Function? addToCart;
  Function? buyNow;
  ButtonsRow({super.key, this.addToCart,this.buyNow});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
                width: 120.w,
                height: 50.h,
                backgroundColor: CustomColors.blue,
                radius: 18,
                text: 'Buy Now',
                func: () {
                  buyNow!();
                },
                style: Styles.textStyle16
                    .copyWith(color: Colors.white)),
            CustomButton(
                width: 205.w,
                height: 50.h,
                backgroundColor: Colors.white,
                radius: 18,
                icon: Icons.shopping_cart,
                text: 'Add to Cart',
                func: () {
                  addToCart!();
                  showDialog(context: context, builder:(context) => const Dialog(child: AddedToCartAlert()),);
                },
                style: Styles.textStyle16
                    .copyWith(color: CustomColors.blue)),
          ],
        ),
        SizedBox(height: 30.h,),
      ],
    );
  }
}
