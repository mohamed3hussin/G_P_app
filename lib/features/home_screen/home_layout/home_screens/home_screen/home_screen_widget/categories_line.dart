import 'package:flutter/material.dart';
import '../../../../../../core/text_style/styles.dart';


class CategoriesLine extends StatelessWidget {
  const CategoriesLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Categories',
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w700,color: const Color(0xFF1B72C0)),),
      ],
    );
  }
}
