import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/colors/colors.dart';
import '../../../logic/dashBoardCubit/dashboard_cubit.dart';
import '../../widget/delete_logo_alert.dart';
import '../edit_logo_screen/edit_logo_screen.dart';

class EditAndDeleteLogoButtons extends StatelessWidget {
  final logo;
  final DashboardCubit cubit;

  const EditAndDeleteLogoButtons({
    Key? key,
    required this.logo,
    required this.cubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            color: const Color(0xFFFCFCFC),
            boxShadow: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 6.60,
                offset: Offset(2, 4),
                spreadRadius: 0,
              ),
            ],
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditLogoScreen(
                    logo.name,
                    logo.cost.toString(),
                    logo.quantity.toString(),
                    logo.id,
                    logo.pictureUrl,
                  ),
                ),
              );
            },
            child: const Icon(
              Icons.edit,
              color: Color(0xFFF8B84E),
              size: 21,
            ),
          ),
        ),
        SizedBox(width: 8.w),
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => Dialog(
                child: DeleteLogoAlert(
                  'Want To delete this Logo?',
                  'You will delete this logo if you click the delete button',
                  logo.id.toString(),
                ),
              ),
            );
          },
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: const Color(0xFFFCFCFC),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 6.60,
                  offset: Offset(2, 4),
                  spreadRadius: 0,
                ),
              ],
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Icon(
              Icons.delete_forever_outlined,
              color: CustomColors.red,
              size: 22,
            ),
          ),
        ),
      ],
    );
  }
}
