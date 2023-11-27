import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/shared_widget/default_text.dart';

import '../../../core/assets_data/iconBroken.dart';

class FullNameLine extends StatelessWidget {
  final nameController;

  const FullNameLine({super.key, required this.nameController});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.symmetric(vertical: 5.h),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10.sp),
        child: defaultTextField(
          type: TextInputType.name,
          controller: nameController,
          label: 'Full Name',
          prefix: IconBroken.User,
          validate: (value)
          {
            if(value!.isEmpty)
            {

              return 'name most not empty';
            }
            else{
              return null;}
          },
        ),
      ),
    );
  }
}
