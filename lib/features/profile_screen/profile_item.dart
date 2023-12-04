import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Color(0xFFEFEFEF)
      ),
      child: Row(
        children: [
          Icon(Icons.person),
          Text('Account'),
          SizedBox(width: 100.w,),
          Icon(Icons.arrow_forward_ios_sharp)
        ],
      ),
    );
  }
}
