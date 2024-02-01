import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../../core/colors/colors.dart';
import '../../../../../../../../../core/text_style/styles.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w,vertical: 20.h),
      width: 340.w,
      height: 430.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white),
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'EG 123468902',
              style: Styles.textStyle20,
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              'Albany, New York',
              style: Styles.textStyle12,
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              height: 165.h,
              width: 318.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: CustomColors.lightGrey,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Collection Point',
              style: Styles.textStyle12,
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
                width: 300.w,
                height: 45.h,
                child: Text(
                  '21445 W 30th New York NY 23103-2847 USA 22 Aug, 2022 13:30 - 14:30',
                  maxLines: 2,
                  style: Styles.textStyle14,
                  overflow: TextOverflow.ellipsis,
                )),
            SizedBox(
              height: 8.h,
            ),
            Container(
              height: 65.h,
              width: 318.w,
              decoration: BoxDecoration(
                  color: CustomColors.lightGrey,
                  borderRadius: BorderRadius.circular(12.r)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 11.h, horizontal: 31.w),
                child: Container(
                  width: 250.w,
                  child: Text(
                    'You can change pick-up time for your order by 9:00 21 Aug',
                    textAlign: TextAlign.center,
                    style: Styles.textStyle14!
                        .copyWith(color: CustomColors.green),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
