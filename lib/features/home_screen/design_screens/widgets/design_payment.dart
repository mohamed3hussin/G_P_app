import 'package:flutter/material.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';

import '../../../../data/model/response/AllProductResponse.dart';
import '../../../../data/model/response/LogoResponse.dart';

class DesignPayment extends StatelessWidget {
  Data data;
  DesignPayment(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    var totalPayment=data.price!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Total payment:',style: Styles.textStyle16,),
          Text('${totalPayment.toStringAsFixed(2)} \$ ',style: Styles.textStyle16.copyWith(color: CustomColors.blue),),
        ],),
      ],
    );
  }
}
