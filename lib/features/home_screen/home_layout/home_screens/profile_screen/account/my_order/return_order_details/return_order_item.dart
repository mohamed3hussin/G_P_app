import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/my_order/return_order_details/return_prodcut_reason_view.dart';

class ReturnOrderItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h,top: 8.h,left: 16.w,right: 16.w),
      child: Container(
        width: 345.w,
        height: 160.h,
        decoration: BoxDecoration(
          color: CustomColors.lightGrey,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8.r),
              child: Image.asset(AssetsData.orderItem),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Autumn collection',
                  style: Styles.textStyle16!.copyWith(color: Colors.black,fontSize: 18.sp),
                ),
                Text(
                  '\$ 24.00',
                  style:
                  Styles.textStyle20!.copyWith(color: CustomColors.green),
                ),
                SizedBox(height: 15.h,),
                Padding(
                  padding: EdgeInsets.only(left: 90.w, right: 8),
                  child: InkWell(
                    onTap: (){Navigator.pushNamed(context, ReturnProductReasonView.routeName);},
                    child: Container(
                      width: 100.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: CustomColors.blue),
                        borderRadius: BorderRadius.circular(8.r)
                      ),
                      child: Center(
                        child: Text(
                          'Return',
                          style: Styles.textStyle12!.copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
