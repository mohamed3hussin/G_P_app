import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/my_order/rate_product/rating_widget.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      margin: EdgeInsets.only(bottom: 20.h),
      width: 330,
      height: 160,
      decoration: BoxDecoration(
        border: Border.all(color: CustomColors.lightGrey,width: 2),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: ShapeDecoration(
                  color: Color(0xFFD9D9D9),
                  shape: OvalBorder(),
                ),
              ),
              Column(children: [
                Text('Mahmoud Eidhan', style: Styles.textStyle14),
                Text('10:00 AM, 20 Oct 2021', style: Styles.textStyle12),
              ]),
              RatingWidget(rating: 4,size: 15,),
            ],
          ),
          SizedBox(height: 10.h,),
          Text(
              'Hade pisan mang urang meuli jacket asalna nu orange ktu hade warna na mengkilap like very good beautifullly process',style: Styles.textStyle12,)],
      ),
    );
  }
}
