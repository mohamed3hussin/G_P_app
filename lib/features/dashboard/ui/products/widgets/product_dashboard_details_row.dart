import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/text_style/styles.dart';

class ProductDetailsRow extends StatelessWidget {
  final String size;
  final String color;

  const ProductDetailsRow({Key? key, required this.size, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 8.w),
        Text('not designable', style: Styles.textStyle12),
        SizedBox(width: 15.w),
        Text('Size : $size', style: Styles.textStyle12),
        SizedBox(width: 15.w),
        Text('Color : $color', style: Styles.textStyle12),
      ],
    );
  }
}
