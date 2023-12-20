import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/my_order/past_order_details/past_order_details_view.dart';

class PastOrderItem extends StatelessWidget {
  String orderId;
  String orderStatus;
  String arrivalTime;
  String numOfItems;
  String address;
  bool isPacked;
  bool isArrived;
  bool isDelivered;

  PastOrderItem(
      {required this.orderId,
      required this.orderStatus,
      required this.arrivalTime,
      required this.numOfItems,
      required this.address,
      required this.isPacked,
      required this.isArrived,
      required this.isDelivered});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Navigator.pushNamed(context, PastOrderDetailsView.routeName);},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            width: 340.w,
            height: 170.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(15.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        orderId,
                        style: Styles.textStyle16!.copyWith(
                            color: isArrived ? Colors.black : Color(0xFF74777F)),
                      ),
                      Container(
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: isPacked
                              ? CustomColors.lightPink
                              : isDelivered
                                  ? CustomColors.lightOrange
                                  : CustomColors.lightGreen,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Center(
                            child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 5.h),
                          child: Text(
                            orderStatus,
                            style: Styles.textStyle12!.copyWith(color: isArrived ? Colors.black : Color(0xFF74777F)),
                          ),
                        )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    arrivalTime,
                    style: Styles.textStyle12,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    numOfItems,
                    style: Styles.textStyle14!.copyWith(
                        fontWeight: FontWeight.w700, color: Colors.black),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Text(
                    address,
                    style: Styles.textStyle12,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
