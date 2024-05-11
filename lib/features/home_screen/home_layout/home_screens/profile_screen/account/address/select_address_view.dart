import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/address/edit_address_view.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/address/widget/address_item.dart';
import '../../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../../core/text_style/styles.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

class SelectAddressView extends StatelessWidget {
  static const String routeName='select_address';
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
          'Select Address',
          style: Styles.textStyle24,
        ),
        titleSpacing: 4,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 15.h,
          ),
          AddressItem(true),
          AddressItem(false),
          SizedBox(height: 20.h,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, EditAddressView.routeName);
              },
              child: Container(
                height: 60.h,
                decoration: BoxDecoration(
                    border: DashedBorder.fromBorderSide(
                        dashLength: 5, side: BorderSide(color: Color(0xFF74777F), width: 2)),
                    borderRadius: BorderRadius.all(Radius.circular(8))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.add,color: Color(0xFF74777F)),
                    Text('Add Delivery Address',style: Styles.textStyle16!.copyWith(color: Color(0xFF74777F)),),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
