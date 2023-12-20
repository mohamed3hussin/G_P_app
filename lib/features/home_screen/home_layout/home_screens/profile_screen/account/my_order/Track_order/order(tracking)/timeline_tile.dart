import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/my_order/Track_order/order(tracking)/time_card.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'event_card.dart';

class CustomTimeLine extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final String process;
  final String address;
  final String date;
  final String time;

  CustomTimeLine(
      {required this.isFirst,
      required this.isLast,
      required this.isPast,
      required this.process,
      required this.address,
      required this.date,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: TimelineTile(
        startChild: TimeCard(date: date,time: time),
        alignment: TimelineAlign.manual,
        lineXY: 0.25,
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle:
            LineStyle(color: isPast ? CustomColors.blue : Color(0xFFE5E5E5)),
        indicatorStyle: IndicatorStyle(
          color: isPast ? CustomColors.blue : Color(0xFFE5E5E5),
          width: 30.w,
          iconStyle: IconStyle(
              iconData: Icons.done,
              color: isPast ? Colors.white : Color(0xFFE5E5E5)),
        ),
        endChild: EventCard(
          process: process,
          address: address,
        ),
      ),
    );
  }
}
