import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/shared_widget/custom_button.dart';

import '../../../core/assets_data/iconBroken.dart';
import '../../../core/colors/colors.dart';
import '../../../core/text_style/styles.dart';
import 'design_explain_screen2.dart';


class DesignExplainScreenOne extends StatelessWidget {
  static const String routeName = 'design_one';

  const DesignExplainScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.h,
        backgroundColor: const Color(0xFFEFF1F8),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            IconBroken.Arrow___Left_2,
            color: CustomColors.blue,
          ),
        ),
        leadingWidth: 40.w,
        title: Text(
                  'Design',
                  style: Styles.textStyle24,
                ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                IconBroken.Search,
                color: Color(0xFF1B72C0),
                size: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                IconBroken.Buy,
                color: Color(0xFF1B72C0),
                size: 30,
              ))
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsData.designBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              AssetsData.designImage1,
              height: 155.h,
              width: 250.w,
            ),
            SizedBox(
              height: 100.h,
            ),
            Center(
                child: Text(
              'Choose the design \n that suits you',
              style: Styles.textStyle16,
              textAlign: TextAlign.center,
            )),
            SizedBox(
              height: 70.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: CustomButton(
                  backgroundColor: CustomColors.blue,
                  text: 'Next',
                  func: () {Navigator.pushNamed(context, DesignExplainScreenTwo.routeName);},
                  style: Styles.textStyle16.copyWith(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
