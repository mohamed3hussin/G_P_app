import 'package:flutter/material.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';

import '../../../data/model/response/AllProductResponse.dart';
import '../../../data/model/response/LogoResponse.dart';

class DesignPayment extends StatelessWidget {
  Logo logo;
  Data data;
  DesignPayment(this.logo,this.data);

  @override
  Widget build(BuildContext context) {
    var totalPayment=data.price!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Total payment:',style: Styles.textStyle16,),
          Text('${totalPayment.toStringAsFixed(2)} \$ ',style: Styles.textStyle16!.copyWith(color: CustomColors.blue),),
        ],),
        // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text('Product:',style: Styles.textStyle16,),
        //     Text('${data.price} \$'.toString(),style: Styles.textStyle16,),
        //   ],),
        // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text('Design:',style: Styles.textStyle16,),
        //     Text('${logo.cost} \$',style: Styles.textStyle16,),
        //   ],),
      ],
    );
  }
}
