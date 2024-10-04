import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/colors/colors.dart';
import 'action_icon_widget.dart';

class ProductActions extends StatelessWidget {
  final Function onEdit;
  final Function onDelete;

  const ProductActions({
    Key? key,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => onEdit(),
          child: ActionIcon(
            icon: Icons.edit,
            color: const Color(0xFFF8B84E),
          ),
        ),
        SizedBox(width: 6.w),
        InkWell(
          onTap: () => onDelete(),
          child: ActionIcon(
            icon: Icons.delete_forever_outlined,
            color: CustomColors.red,
          ),
        ),
      ],
    );
  }
}
