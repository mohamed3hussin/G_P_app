import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';

class AddressItem extends StatelessWidget {
  bool isHome;
  AddressItem(this.isHome, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h,left: 15.w,right: 15.w),
      padding: EdgeInsets.all(10.r),
      width: 350.w,
      height: 100.h,
      decoration: BoxDecoration(
        border: Border.all(width: 1.3,color: CustomColors.lightGrey),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Alexander Michael',style: Styles.textStyle16,),
              SizedBox(height: 10.h,),
              SizedBox(
                width: 200.w,
                height: 38.h,
                child: Text(
                  'Pangandaran Brick Street No. 690 445434 Yogya, Central Java',style: Styles.textStyle12,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(4.r),
            width: 70,
            height: 30,
            decoration: BoxDecoration(
              color: isHome?const Color(0xFFFCF1F4):const Color(0x191AD598),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(isHome?Icons.home_filled:Icons.home_work_outlined,color: isHome?Colors.black:CustomColors.green,size: 20.r,),
                Text(isHome?'Home':'Office',style: Styles.textStyle12.copyWith(color: isHome?Colors.black:CustomColors.green,fontWeight: FontWeight.w700),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
