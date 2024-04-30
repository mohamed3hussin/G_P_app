import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import '../../../core/colors/colors.dart';
import '../../../core/text_style/styles.dart';
import '../../../data/model/response/AllProductResponse.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    var args= ModalRoute.of(context)?.settings.arguments as Data;
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
        ReadMoreText(args.description??'',
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
