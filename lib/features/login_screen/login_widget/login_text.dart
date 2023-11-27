import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/text_style/styles.dart';

class loginText extends StatelessWidget {
  const loginText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 100.h,
            child: Image(
                image: AssetImage(AssetsData.loginImage))),
        SizedBox(
          height: 10.0.h,
        ),
        Text(
            'Log In',
            style: Styles.textStyle32.copyWith(color: Color(0xFF270008))
        ),
        SizedBox(
          height: 5.0.h,
        ),
        Text(
          'Login now to design your shirt',
          style: Styles.textStyle14.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
