import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';

class TabItem extends StatelessWidget {
  final bool isSelected;
  final String name;
  final VoidCallback onTap;
  IconData? icon;
  TabItem({super.key, required this.onTap,required this.name, required this.isSelected,this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.h,
        margin: const EdgeInsets.only(top: 15),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? CustomColors.blue : CustomColors.darkGrey,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            icon!=null?Padding(
              padding:EdgeInsets.only(right: 2.w),
              child: Icon(icon,color: isSelected ? CustomColors.blue : Colors.black,),
            ):const SizedBox(),
            Text(
              name,
              style: Styles.textStyle16.copyWith(
                color: isSelected ? CustomColors.blue : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
