import 'package:flutter/material.dart';
import 'package:g_p_app/core/text_style/styles.dart';

class ForYouLine extends StatelessWidget {
  Function function;
  ForYouLine(this.function, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'For you',
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
