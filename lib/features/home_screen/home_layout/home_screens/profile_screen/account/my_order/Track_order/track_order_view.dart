import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/my_order/Track_order/order(tracking)/order_details_widget.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/my_order/Track_order/order(tracking)/timeline_tile.dart';
import '../../../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../../../core/text_style/styles.dart';

class TrackOrderView extends StatefulWidget {
  static const String routeName = 'track_order';
  @override
  State<TrackOrderView> createState() => _TrackOrderViewState();
}
class _TrackOrderViewState extends State<TrackOrderView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.lightGrey,
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
          'Track Order',
          style: Styles.textStyle24,
        )),
        titleSpacing: 4,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderDetails(),
            Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Text(
                'History',
                style: Styles.textStyle20,
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              height: 280.h,
              width: 340.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.white),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  children: [
                    CustomTimeLine(
                      isFirst: true,
                      isLast: false,
                      isPast: true,
                      date: '22 June',
                       time: '13:30',
                      process: 'Accepted by the store',
                      address: 'Sacramento, California',
                    ),
                    CustomTimeLine(
                      isFirst: false,
                      isLast: false,
                      isPast: true,
                      date: '22 June',
                      time: '13:30',
                      process: 'Package have been received',
                      address: 'Albany, New York',
                    ),
                    CustomTimeLine(
                      isFirst: false,
                      isLast: true,
                      isPast: false,
                      date: '22 June',
                      time: '13:30',
                      process: 'Arrived at destination',
                      address: 'Sacramento, California',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
