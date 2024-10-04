import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import '../../../../../core/colors/colors.dart';
import '../../../../../core/shared_widget/custom_button.dart';
import '../../../../../core/text_style/styles.dart';

class OrderSuccessView extends StatelessWidget {
  static const String routeName='order_success_view';

  const OrderSuccessView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
      child: SizedBox(
        height: 550.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsData.successOrderImage,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 30.h),
              child: Center(
                child: Text(
                  'Order Success',
                  style: Styles.textStyle24.copyWith(color: const Color(0xFF1B72C0),fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            Text(
              'Thank you for your order here and your package will be sent to your address very quickly and fast good product',
              style: Styles.textStyle14.copyWith(color: Colors.black),textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h,),
            CustomButton(
              height: 56,
              width: double.infinity,
              radius: 12,
              backgroundColor: CustomColors.blue,
              text: 'Continue Shopping',
              func: (){Navigator.pop(context);},
              style: Styles.textStyle16.copyWith(color: Colors.white,fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
