import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/my_order/rate_product/rating_widget.dart';

import '../../../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../../../core/text_style/styles.dart';

class RateProductView extends StatelessWidget {
  static const String routeName = 'rate_product';

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
        title: Text(
                  'My Order',
                  style: Styles.textStyle24,
                ),
        titleSpacing: 4,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Container(
              width: 150.w,
              height: 180.h,
              child: Column(
                children: [
                  Image.asset(AssetsData.watch),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text('Orlando Watch'),
                  SizedBox(
                    height: 12.h,
                  ),
                  RatingWidget(rating: 4),
                ],
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add Description',
                    style: Styles.textStyle16,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 160.h,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      maxLines: null,
                      expands: true,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          hintText: 'Type your opinion here.',
                          hintStyle: Styles.textStyle16!.copyWith(
                              fontWeight: FontWeight.w400, color: Colors.grey),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: BorderSide(
                                color: Colors.black,
                              ))),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Center(
                    child: Container(
                      width: 325.w,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Submit Feedback',
                          style: Styles.textStyle20!.copyWith(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          )
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
