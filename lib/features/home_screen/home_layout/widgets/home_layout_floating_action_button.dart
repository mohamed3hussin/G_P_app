import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../design_screens/design_explain_screen1.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65.w,
      height: 65.h,
      child: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, DesignExplainScreenOne.routeName);
        },
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment(0.69, -0.75),
              end: Alignment(-0.69, 0.72),
              colors: [Color(0xFFD3E4FF), Color(0xFF1B72C0)],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.r),
            child: Image.asset(
              'assets/images/floating_action_button_img.png',
            ),
          ),
        ),
      ),
    );
  }
}
