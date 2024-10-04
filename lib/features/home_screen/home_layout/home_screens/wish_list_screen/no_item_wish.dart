import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/assets_data/assetsData.dart';
import '../../../../../core/colors/colors.dart';
import '../../../../../core/shared_widget/custom_button.dart';
import '../../../../../core/text_style/styles.dart';

class noItemWish extends StatelessWidget {
  const noItemWish({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w,vertical: 50.h),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              const CircleAvatar(radius: 100,backgroundColor: Color(0xFFEFF1F8),),
              Image.asset(AssetsData.wishListImage,height: 150.h,width: 150.w,),
            ],
          ),
          SizedBox(height: 60.h,),
          Align(
            alignment: AlignmentDirectional.center,
            child: Text(
              'No Item',
              style: Styles.textStyle24.copyWith(color: const Color(0xFF120F33),fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: 70.h,),
          CustomButton(
            height: 50.h,
            backgroundColor: CustomColors.blue,
            text: 'Start Shopping',
            func: (){},
            style: Styles.textStyle16.copyWith(color: Colors.white,fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
