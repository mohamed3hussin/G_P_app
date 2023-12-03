import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/iconBroken.dart';
import 'package:g_p_app/core/helper/hundel_size.dart';
import 'package:g_p_app/core/shared_widget/default_text.dart';
import 'package:g_p_app/core/text_style/styles.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: context.deviceHeight / 3,
                width: context.deviceWidth / 2,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    color: Color(0xFFEFF1F8),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100))),
                child: Center(
                    child: Image.asset('assets/images/chatgpt robot.png')),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24.sp),
              child: Align(
                alignment: Alignment.center,
                child: Image.asset('assets/images/indicator3.png',height: 8.sp,width: 48.sp,),
              ),
            ),
            SizedBox(
              height: 64.sp,
            ),
            Text(
              'New Password',
              style: Styles.textStyle24,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Enter Your New Password',
                  style: Styles.textStyle14),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
                child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10.sp),
                    child: defaultTextField(
                        type: TextInputType.text,
                        label: 'Password',
                        prefix: IconBroken.Lock))),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
                child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10.sp),
                    child: defaultTextField(
                        type: TextInputType.text,
                        label: 'Confirm Password',
                        prefix: IconBroken.Lock))),
            SizedBox(
              height: context.deviceHeight *0.05,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.all(16.sp),
                height: context.deviceHeight*0.06,
                width: context.deviceWidth*0.16,
                child: ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(8),
                    backgroundColor: Color(0XFF1B72C0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.sp),
                    ),
                  ),
                  onPressed: () {},
                  child: Icon(IconBroken.Arrow___Right_2,color: Colors.white,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
