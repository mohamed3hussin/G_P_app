import 'package:flutter/material.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/product_details/widgets/color_container.dart';

class ColorLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Colors',
          style: Styles.textStyle16,
        ),
        Row(
          children: [
            ColorContainer(Colors.red),
            ColorContainer(Colors.black),
            ColorContainer(Colors.green),
            ColorContainer(Colors.blueAccent),
            ColorContainer(Colors.purple),
            ColorContainer(Colors.yellow),
          ],
        ),
      ],
    );
  }
}
