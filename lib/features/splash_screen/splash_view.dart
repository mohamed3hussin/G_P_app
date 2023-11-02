import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/helper/hundel_size.dart';

import '../../core/text_style/styles.dart';

class splashView extends StatelessWidget {
  const splashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('splash screen',
              style: TextStyle(fontSize: 24.sp),
            ),
            SizedBox(height: context.deviceHeight/40,),
            Text('splash screen',
              style: Styles.textStyle32,
            ),
          ],
        ),
      ),
    );
  }
}
