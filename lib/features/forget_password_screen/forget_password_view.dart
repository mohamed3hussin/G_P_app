import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/iconBroken.dart';
import 'package:g_p_app/core/helper/hundel_size.dart';
import 'package:g_p_app/core/shared_widget/default_text.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/forget_password_screen/custom_page_route.dart';
import 'package:g_p_app/features/forget_password_screen/verification.dart';

class ForgetPasswordView extends StatelessWidget {
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
                    child: Image.asset('assets/images/chatgpt robot sad.png')),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24.sp),
              child: Align(
                alignment: Alignment.center,
                child: Image.asset('assets/images/indicator1.png',height: 8.sp,width: 48.sp,),
              ),
            ),
            SizedBox(
              height: 64.sp,
            ),
            Text(
              'Forget Password?',
              style: Styles.textStyle24,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Enter your email or mobile number',
                  style: Styles.textStyle14),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
                child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10.sp),
                    child: defaultTextField(
                        type: TextInputType.text,
                        label: 'Email Or Mobile Number',
                        prefix: IconBroken.Message))),
            SizedBox(
              height: context.deviceHeight*0.08,
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
                  onPressed: () {
                   Navigator.of(context).push(_createRoute());

                  },
                  child: Icon(IconBroken.Arrow___Right_2,color: Colors.white,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Route _createRoute() {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 350),
      reverseTransitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => VerificationView(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
            position: Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
                .animate(animation),
            child: child);
      },
    );
  }
}
