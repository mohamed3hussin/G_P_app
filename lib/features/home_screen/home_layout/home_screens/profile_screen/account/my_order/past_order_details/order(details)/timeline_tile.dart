import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'event_card.dart';

class CustomTimeLine extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final IconData icon;
  final String process;
  final String date;


  const CustomTimeLine(
      {super.key, required this.isFirst,
      required this.isLast,
        required this.icon,
      required this.process,
      required this.date,
});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: TimelineTile(
          alignment: TimelineAlign.start,
          lineXY: 0.3,
          isFirst: isFirst,
          isLast: isLast,
          beforeLineStyle:
              const LineStyle(color: Colors.black,thickness: 3),
          indicatorStyle: IndicatorStyle(

            color: CustomColors.lightBlue,
            width: 50.w,
            iconStyle: IconStyle(
                iconData: icon,
                fontSize: 25,
                color: CustomColors.blue),
          ),
          endChild: EventCard(
            process: process,
            date: date,
          ),
        ),
      ),
    );
  }
}
