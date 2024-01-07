import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/colors/colors.dart';
import '../../../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../../../core/text_style/styles.dart';

class ReturnProductReasonView extends StatelessWidget {
  static const String routeName = 'return_reason';

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
          child: Icon(IconBroken.Arrow___Left),
        ),
        leadingWidth: 40.w,
        title: Center(
            child: Text(
          'Return Order',
          style: Styles.textStyle24,
        )),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: CustomColors.yellow,
                        size: 30.r,
                      ),
                      Icon(
                        Icons.star,
                        color: CustomColors.yellow,
                        size: 30.r,
                      ),
                      Icon(
                        Icons.star,
                        color: CustomColors.yellow,
                        size: 30.r,
                      ),
                      Icon(
                        Icons.star,
                        color: CustomColors.yellow,
                        size: 30.r,
                      ),
                      Icon(
                        Icons.star_border,
                        color: CustomColors.yellow,
                        size: 30.r,
                      ),
                    ],
                  ),
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
                    'Tell us why you want to return this product :',
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
                          hintText: 'Type your comments here.',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap:(){},
                        child: Container(
                          width: 170.w,
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(color: CustomColors.blue)
                          ),
                          child: Center(
                            child: Text(
                              'Customer Service',
                              style: Styles.textStyle16!.copyWith(color: CustomColors.blue),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w,),
                      Container(
                        width: 160.w,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Submit',
                            style: Styles.textStyle16!.copyWith(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: CustomColors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              )
                          ),
                        ),
                      ),
                    ],
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
