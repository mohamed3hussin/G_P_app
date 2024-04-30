import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/product_details/widgets/size_container.dart';

import '../../../data/model/response/AllProductResponse.dart';

class SizeLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Data;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Size',
        style: Styles.textStyle16,
      ),
      Container(
        height: 60.h,
        child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => SizeContainer(args.productSize?[index].sizename??''),
                itemCount: args.productSize?.length,
              ),
      )
    ]);
  }
}
