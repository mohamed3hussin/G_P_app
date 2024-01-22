import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/design_screens/design_details_view.dart';

import '../../core/assets_data/assetsData.dart';
import '../../core/assets_data/iconBroken.dart';
import '../../core/colors/colors.dart';
import '../../core/shared_widget/custom_button.dart';
import '../../core/text_style/styles.dart';

class DesignExplainScreenThree extends StatelessWidget {
  static const String routeName = 'design_three';

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
          child: Icon(
            IconBroken.Arrow___Left_2,
            color: CustomColors.blue,
          ),
        ),
        leadingWidth: 40.w,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                IconBroken.Search,
                color: Color(0xFF1B72C0),
                size: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                IconBroken.Buy,
                color: Color(0xFF1B72C0),
                size: 30,
              ))
        ],
        title: Center(
            child: Text(
              'Design',
              style: Styles.textStyle24,
            )),
        titleSpacing: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
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
              AssetsData.designImage3,
              height: 155.h,
              width: 250.w,
            ),
            SizedBox(
              height: 100.h,
            ),
            Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Text(
                    'Find out how much it costs and order it to receive it as soon as possible',
                    style: Styles.textStyle16,
                    textAlign: TextAlign.center,
                  ),
                )),
            SizedBox(
              height: 70.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: CustomButton(
                  backgroundColor: CustomColors.blue,
                  text: 'Go to design page',
                  func: () {
                    Navigator.pushNamed(context, DesignDetailsView.routeName);
                  },
                  style: Styles.textStyle16!.copyWith(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
