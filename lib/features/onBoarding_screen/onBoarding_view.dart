import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/helper/hundel_size.dart';

import '../../core/text_style/styles.dart';

class onBoardingView extends StatefulWidget {
  const onBoardingView({Key? key}) : super(key: key);

  @override
  State<onBoardingView> createState() => _onBoardingViewState();
}

class _onBoardingViewState extends State<onBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('on boarding screen',
              style: TextStyle(fontSize: 24.sp),
            ),
            SizedBox(height: context.deviceHeight/40,),
            Text('on boarding screen',
              style: Styles.textStyle32,
            ),
          ],
        ),
      ),
    );
  }
}
