import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/text_style/styles.dart';

class SignUpWithLine extends StatelessWidget {
  const SignUpWithLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
            'Or Sign Up With',
            style: Styles.textStyle16.copyWith(color: Color(0xFF1B72C0))
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            MaterialButton(
              padding: EdgeInsetsDirectional.all(0),
              minWidth: 0,
              onPressed: (){},
              child:SvgPicture.asset(
                AssetsData.gmailImage,

              ),
            ),
            MaterialButton(
              padding: EdgeInsetsDirectional.all(0),
              minWidth: 0,
              onPressed: (){},
              child:SvgPicture.asset(
                AssetsData.facebookImage,

              ),
            ),
            MaterialButton(
              padding: EdgeInsetsDirectional.all(0),
              minWidth: 0,
              onPressed: (){},
              child:SvgPicture.asset(
                AssetsData.instaImage,

              ),
            ),
          ],
        ),
      ],
    );
  }
}
