import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/assets_data/assetsData.dart';
import '../../../core/assets_data/iconBroken.dart';
import '../../../core/colors/colors.dart';
import '../../../core/shared_widget/custom_button.dart';
import '../../../core/text_style/styles.dart';
import 'design_explain_screen3.dart';

class DesignExplainScreenTwo extends StatelessWidget {
  static const String routeName = 'design_two';

  const DesignExplainScreenTwo({super.key});

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
        title: Text(
          'Design',
          style: Styles.textStyle24,
        ),
        titleSpacing: 4,
        leadingWidth: 40.w,
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
              AssetsData.designImage2,
              height: 190.h,
              width: 250.w,
            ),
            SizedBox(
              height: 50.h,
            ),
            Center(
                child: Text(
                  'Or design your own T-shirt with \n your own design and upload it',
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
                  func: () {Navigator.pushNamed(context, DesignExplainScreenThree.routeName);},
                  style: Styles.textStyle16.copyWith(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
