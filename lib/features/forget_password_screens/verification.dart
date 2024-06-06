import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import '../login_screen/loginScreenView.dart';
import 'custom_page_route.dart';
import 'new_password.dart';

class VerificationView extends StatefulWidget {
  static const String routeName='verification_view';

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 3), () {

        Navigator.of(context).pushReplacementNamed(NewPasswordView.routeName);
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                padding: EdgeInsets.all(8.r),
                child: Image.asset(AssetsData.staringRobot,width: 90.w,height: 180.h,),
              )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 24.r),
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(AssetsData.indicator2,height: 8.h,width: 48.w,),
            ),
          ),
          SizedBox(
            height: 64.h,
          ),
          Text(
            'Request in Progress',
            style: Styles.textStyle24,
          ),
          Padding(
            padding: EdgeInsets.all(8.r),
            child: Text("we are processing your request\n this may take a few moments...",
                style: Styles.textStyle14),
          ),
          SizedBox(height: 50.h,),
          Center(
            child: CircularProgressIndicator(
              backgroundColor: CustomColors.lightGrey,
              color: CustomColors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
