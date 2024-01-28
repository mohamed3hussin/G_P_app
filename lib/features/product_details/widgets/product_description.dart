import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import '../../../core/colors/colors.dart';
import '../../../core/text_style/styles.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: Styles.textStyle20,
        ),
        SizedBox(
          height: 8.h,
        ),
        ReadMoreText(
          'Maecenas sagittis, dui at venenatis bibendum, dui '
              'odio lobortis mauris, sit amet mollis odio felis '
              'at justo. Sed a malesuada turpis, acimperdiet  turpis '
              'Maecenas sagittis, dui at venenatis bibendum, dui '
              'odio lobortis mauris, sit amet mollis odio felis '
              'at justo. Sed a malesuada turpis, acimperdiet  turpis.',
          trimLines: 2,
          trimMode: TrimMode.Line,
          lessStyle: Styles.textStyle14!
              .copyWith(color: CustomColors.blue),
          moreStyle: Styles.textStyle14!
              .copyWith(color: CustomColors.blue),
          trimCollapsedText: 'Show More',
          trimExpandedText: 'Show Less',
        ),
      ],
    );
  }
}
