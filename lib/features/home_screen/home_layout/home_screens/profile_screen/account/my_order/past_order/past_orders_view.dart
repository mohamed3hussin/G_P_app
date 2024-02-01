import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/my_order/past_order/past_order_item.dart';
import '../../../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../../../core/colors/colors.dart';
import '../../../../../../../../core/text_style/styles.dart';

class PastOrdersView extends StatelessWidget {
  static const String routeName = 'past_orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 90.h,
        backgroundColor: Color(0xFFEFF1F8),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(IconBroken.Arrow___Left_2,color: CustomColors.blue,),
        ),
        leadingWidth: 40.w,
        title: Text(
                  'Past Orders',
                  style: Styles.textStyle24,
                ),
        titleSpacing: 4,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 16.h,
            ),
            PastOrderItem(
                orderId: '#4678965450',
                orderStatus: 'Packed',
                arrivalTime: 'Today at 08:00 PM',
                numOfItems: '2 Items',
                address:
                    'Pangandaran Brick Street No. 690 Code 445434 Yogyakarta, Central Java',
                isPacked: true,
                isArrived: false,
                isDelivered: false),
            PastOrderItem(
                orderId: '#4678965450',
                orderStatus: 'Delivered',
                arrivalTime: 'Today at 08:00 PM',
                numOfItems: '2 Items',
                address:
                    'Pangandaran Brick Street No. 690 Code 445434 Yogyakarta, Central Java',
                isPacked: false,
                isArrived: false,
                isDelivered: true),
            PastOrderItem(
                orderId: '#4678965450',
                orderStatus: 'Arrived',
                arrivalTime: 'Today at 08:00 PM',
                numOfItems: '2 Items',
                address:
                    'Pangandaran Brick Street No. 690 Code 445434 Yogyakarta, Central Java',
                isPacked: false,
                isArrived: true,
                isDelivered: false),
            PastOrderItem(
                orderId: '#4678965450',
                orderStatus: 'Packed',
                arrivalTime: 'Today at 08:00 PM',
                numOfItems: '2 Items',
                address:
                    'Pangandaran Brick Street No. 690 Code 445434 Yogyakarta, Central Java',
                isPacked: true,
                isArrived: false,
                isDelivered: false),
          ],
        ),
      ),
    );
  }
}
