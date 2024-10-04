import 'package:flutter/material.dart';
import 'package:g_p_app/core/text_style/styles.dart';

class BestSellingLine extends StatelessWidget {
  Function function;
  BestSellingLine(this.function, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Best Selling',
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w700,color: const Color(0xFF1B72C0)),),
        const Spacer(),
        TextButton(
          onPressed: (){
            function();
          },
          child: Text('SEE ALL',
            style: Styles.textStyle14.copyWith(color: const Color(0xFF44474E),fontWeight: FontWeight.w500),),

        ),

      ],
    );
  }
}
