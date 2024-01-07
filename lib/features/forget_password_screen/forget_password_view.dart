import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/assets_data/iconBroken.dart';
import 'package:g_p_app/core/helper/hundel_size.dart';
import 'package:g_p_app/core/shared_widget/default_text.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/forget_password_screen/verification.dart';

import 'custom_page_route.dart';

class ForgetPasswordView extends StatefulWidget {
  static const String routeName='forget_password_view';
  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  var emailController = TextEditingController();

  var fpformKey = GlobalKey<FormState>();

  @override
  // void dispose() {
  //   emailController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 250.h,
                width: 180.w,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    color: Color(0xFFEFF1F8),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100.r),
                        bottomRight: Radius.circular(100.r))),
                child: Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(AssetsData.sadRobotImage,width: 90.w,height: 180.h,),
                )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24.r),
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AssetsData.indicator1,
                  height: 8.h,
                  width: 48.w,
                ),
              ),
            ),
            SizedBox(
              height: 64.h,
            ),
            Text(
              'Forget Password?',
              style: Styles.textStyle24,
            ),
            Padding(
              padding: EdgeInsets.all(8.r),
              child: Text('Enter your email or mobile number',
                  style: Styles.textStyle14),
            ),
            Form(
              key: fpformKey,
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(10.r),
                      child: defaultTextField(
                        controller: emailController,
                        type: TextInputType.text,
                        label: 'Email Or Mobile Number',
                        prefix: IconBroken.Message,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your email or mobile number';
                          }
                          return null;
                        },
                      ))),
            ),
            SizedBox(
              height: context.deviceHeight * 0.08,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.all(16.r),
                height: context.deviceHeight * 0.06,
                width: context.deviceWidth * 0.16,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(8.r),
                    backgroundColor: Color(0XFF1B72C0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  onPressed: () {
                    if (fpformKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        CustomPageRoute(child: VerificationView()),
                      );
                    }
                  },
                  child: Icon(
                    IconBroken.Arrow___Right_2,
                    color: Colors.white,
                  ),
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
      pageBuilder: (context, animation, secondaryAnimation) =>
          VerificationView(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
            position: Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
                .animate(animation),
            child: child);
      },
    );
  }
}
