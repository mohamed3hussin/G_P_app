import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/colors/colors.dart';
import '../../../../../core/text_style/styles.dart';
import '../../../logic/dashBoardCubit/dashboard_cubit.dart';
import 'edit_and_delete_logo_buttons.dart';

class DashboardLogoItem extends StatelessWidget {
  final int index;
  final logo;
  final DashboardCubit cubit;

  const DashboardLogoItem({
    Key? key,
    required this.index,
    required this.logo,
    required this.cubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: CustomColors.lightGrey,
      ),
      child: Row(
        children: [
          Text('${index + 1}', style: Styles.textStyle14),
          SizedBox(width: 8.w),
          Container(
            width: 42,
            height: 42,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage(logo?.pictureUrl ?? ''),
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          logo?.name ?? '',
                          style: Styles.textStyle14.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Text(
                          logo?.cost.toString() ?? '',
                          style: Styles.textStyle14.copyWith(color: Colors.green),
                        ),
                      ],
                    ),
                    EditAndDeleteLogoButtons(
                      logo: logo,
                      cubit: cubit,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Text(
                      logo?.dateofCreation.substring(0, 10) ?? '',
                      style: Styles.textStyle12,
                    ),
                    SizedBox(width: 15.w),
                    Text(
                      'Quantity : ${logo?.quantity ?? ''}',
                      style: Styles.textStyle12,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

