import 'package:flutter/material.dart';
import 'package:g_p_app/core/text_style/styles.dart';

class ForYouLine extends StatelessWidget {
  const ForYouLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'For You',
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w700,color: Color(0xFF1B72C0)),),
        Spacer(),
        TextButton(
          onPressed: (){},
          child: Text('SEE ALL',
            style: Styles.textStyle12.copyWith(color: Color(0xFF44474E),fontWeight: FontWeight.w500),),

        ),

      ],
    );
  }
}
