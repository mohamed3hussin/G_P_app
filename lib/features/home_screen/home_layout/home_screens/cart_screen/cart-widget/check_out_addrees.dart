import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_cubit.dart';
import '../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../core/colors/colors.dart';
import '../../../../../../core/text_style/styles.dart';

class CheckoutAddress extends StatefulWidget {
  @override
  State<CheckoutAddress> createState() => _CheckoutAddressState();
}

class _CheckoutAddressState extends State<CheckoutAddress> {
  @override
  Widget build(BuildContext context) {
    var cubit=HomeCubit.get(context);
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: CustomColors.darkGrey),
        ),
        child: Material(
          elevation: 1.5,
          borderRadius: BorderRadius.circular(12.r),
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${cubit.userAddress?.firstName} ${cubit.userAddress?.lName}',
                            style: Styles.textStyle14.copyWith(color: CustomColors.textColor, fontWeight: FontWeight.w600),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: CustomColors.lightPink,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.symmetric(horizontal: 7.w, vertical: 2.h),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(IconBroken.Home),
                                  Text(
                                    'Home',
                                    style: Styles.textStyle12.copyWith(fontWeight: FontWeight.w600, color: CustomColors.darkTextColor),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 220.w,
                        child: Text(
                          '${cubit.userAddress?.country}, ${cubit.userAddress?.city}, ${cubit.userAddress?.street}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.textStyle12,
                        ),
                      ),
                      SizedBox(height: 15.h),
                    ],
                  ),
                ),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     TextButton(
                //       onPressed: () {},
                //       child: Text(
                //         'Change',
                //         style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600, color: CustomColors.darkGrey),
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
