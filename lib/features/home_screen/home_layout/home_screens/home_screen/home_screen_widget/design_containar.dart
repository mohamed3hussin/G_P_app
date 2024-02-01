import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/design_screens/design_explain_screen1.dart';

import '../../../../../../core/assets_data/assetsData.dart';
import '../../../../../../core/shared_widget/custom_button.dart';
import '../../../../../../core/text_style/styles.dart';

class DesignContainer extends StatelessWidget {
  const DesignContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xFFD3E4FF))
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Unleash your creativity',
                    style: Styles.textStyle14.copyWith(color: Color(0xFF1B72C0)),),
                  Text(
                    'and fashion sense.',
                    style: Styles.textStyle14.copyWith(color: Color(0xFF1B72C0)),),
                  SizedBox(height: 10.h,),
                  CustomButton(
                    backgroundColor: const Color(0xFF1B72C0),
                    text: 'Design Your Shirt Now!',
                    func: () {Navigator.pushNamed(context, DesignExplainScreenOne.routeName);}, style: Styles.textStyle14.copyWith(color: Colors.white,fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
          Image(image: AssetImage(AssetsData.designButtonImage),)
        ],
      ),
    );
  }
}
