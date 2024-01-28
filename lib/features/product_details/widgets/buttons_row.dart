import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/product_details/added_to_cart_alert.dart';
import '../../../core/colors/colors.dart';
import '../../../core/shared_widget/custom_button.dart';
import '../../../core/text_style/styles.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({super.key});

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
                func: () {},
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
                  showDialog(context: context, builder:(context) => Dialog(child: AddedToCartAlert()),);
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
