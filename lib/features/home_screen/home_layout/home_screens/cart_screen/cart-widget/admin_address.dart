import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/colors/colors.dart';
import '../../../../../../core/text_style/styles.dart';

class AdminAddress extends StatefulWidget {
  const AdminAddress({super.key});

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
