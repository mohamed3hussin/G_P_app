import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_cubit.dart';
import '../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../core/colors/colors.dart';
import '../../../../../../core/text_style/styles.dart';
import '../../../home_cubit/home_state.dart';

class AdminAddress extends StatefulWidget {
  @override
  State<AdminAddress> createState() => _AdminAddressState();
}

class _AdminAddressState extends State<AdminAddress> {
  @override
  Widget build(BuildContext context) {
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
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 15.w, vertical: 30.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('No Address For Admin.',style: Styles.textStyle16,),
                    ],
                  ),
                ),
              ),
            ),
          );


  }
}
