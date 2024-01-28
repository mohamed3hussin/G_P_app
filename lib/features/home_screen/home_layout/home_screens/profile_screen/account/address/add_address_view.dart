import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/address/widget/add_address_field.dart';

import '../../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../../core/text_style/styles.dart';

class AddAddressView extends StatefulWidget {
  static const String routeName='add_address';

  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {
  List<bool> isSelected = [false, false];
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
              'Add Address',
              style: Styles.textStyle24,
            )),
        titleSpacing: 4,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20.h,),
              AddAddressField('Full Name'),
              AddAddressField('Delivery Address'),
              AddAddressField('City'),
              AddAddressField('Zip Code'),
              Text('Select Address Type:',style: Styles.textStyle16,),
              SizedBox(height: 16.h,),
              ToggleButtons(
                selectedBorderColor: CustomColors.blue,
                isSelected: isSelected,
                onPressed: (index) {
                  setState(() {
                    for (int i = 0; i < isSelected.length; i++) {
                      isSelected[i] = i == index;
                    }
                  });
                },
                children: [
                  Container(
                    width: 110.w,
                    height: 45.h,
                    margin: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home),
                        Text(' Home'),
                      ],
                    ),
                  ),
                  Container(
                    width: 110.w,
                    height: 45.h,
                    margin: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home_work_outlined),
                        Text(' Office'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h,),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 330.w,
                  height: 55.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: CustomColors.blue,
                  ),
                  child: Center(
                    child: Text(
                      'Save Address',
                      style: Styles.textStyle20!.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
