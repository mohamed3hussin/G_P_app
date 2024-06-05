import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/colors/colors.dart';
import '../../../core/text_style/styles.dart';
import '../dashBoardCubit/dash_board_cubit.dart';

class DeleteLogoAlert extends StatelessWidget {
  String alertTitle;
  String alertDescription;
  String logoId;
  DeleteLogoAlert(this.alertTitle,this.alertDescription,this.logoId);

  @override
  Widget build(BuildContext context) {
    var cubit=DashBoardCubit.get(context);
    return SizedBox(
      height: 300.h,
      width: 335.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                alertTitle,
                textAlign: TextAlign.center,
                style: Styles.textStyle20.copyWith(color: Colors.black),
              ),
            ),
            SizedBox(height: 25.h,),
            SizedBox(
              width: 250.w,
              child: Text(
                alertDescription,
                style: Styles.textStyle14.copyWith(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 130.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: CustomColors.darkGrey,
                    ),
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: Styles.textStyle16!.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.h,
                ),
                InkWell(
                  onTap: () {
                    cubit.deleteLogo(logoId);
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 130.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(color: CustomColors.red),
                      color: Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        'Delete',
                        style: Styles.textStyle16!.copyWith(
                          color: CustomColors.red,
                          decoration: TextDecoration.underline,
                          decorationColor: CustomColors.red,
                          decorationThickness: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
