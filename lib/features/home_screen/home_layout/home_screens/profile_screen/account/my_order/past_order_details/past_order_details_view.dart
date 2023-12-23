import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/my_order/past_order_details/order(details)/timeline_tile.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/my_order/past_order_details/order_item.dart';
import '../../../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../../../core/colors/colors.dart';
import '../../../../../../../../core/text_style/styles.dart';

class PastOrderDetailsView extends StatelessWidget {
  static const String routeName = 'past_order_details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Center(
            child: Text(
          'Past Orders',
          style: Styles.textStyle24,
        )),
        titleSpacing: 4,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 8.h,
            ),
            OrderItem(),
            OrderItem(),
            CustomTimeLine(
              isFirst: true,
              isLast: false,
              process: 'Order Placed',
              date: 'August 15,2023 ,10AM',
              icon: Icons.fire_truck,
            ),
            CustomTimeLine(
              isFirst: false,
              isLast: false,
              process: 'Order Placed',
              date: 'August 15,2023 ,10AM',
              icon: Icons.fire_truck,
            ),
            CustomTimeLine(
              isFirst: false,
              isLast: false,
              process: 'Order Placed',
              date: 'August 15,2023 ,10AM',
              icon: Icons.fire_truck,
            ),
            CustomTimeLine(
              isFirst: false,
              isLast: true,
              process: 'Order Placed',
              date: 'August 15,2023 ,10AM',
              icon: Icons.fire_truck,
            ),
          ],
        ),
      ),
    );
  }
}
