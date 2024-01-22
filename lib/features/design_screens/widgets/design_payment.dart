import 'package:flutter/material.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';

class DesignPayement extends StatelessWidget {
  const DesignPayement({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Total payement:',style: Styles.textStyle16,),
          Text('\$250.00',style: Styles.textStyle16!.copyWith(color: CustomColors.blue),),
        ],),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Product:',style: Styles.textStyle16,),
            Text('\$395.00',style: Styles.textStyle16,),
          ],),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Design:',style: Styles.textStyle16,),
            Text('\$6.70',style: Styles.textStyle16,),
          ],),
      ],
    );
  }
}
