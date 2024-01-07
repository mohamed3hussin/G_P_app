import 'package:flutter/material.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/product_details/size_container.dart';

class SizeLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: Styles.textStyle16,
        ),
        Row(
          children: [
            SizeContainer('S'),
            SizeContainer('XS'),
            SizeContainer('M'),
            SizeContainer('L'),
            SizeContainer('XL'),
            SizeContainer('XXL'),
          ],
        ),
      ],
    );
  }
}
