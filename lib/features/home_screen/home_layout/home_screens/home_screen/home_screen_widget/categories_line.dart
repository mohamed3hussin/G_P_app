import 'package:flutter/material.dart';

import '../../../../../../core/text_style/styles.dart';
import '../../categories_screen/all_categories_view.dart';

class CategoriesLine extends StatelessWidget {
  const CategoriesLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Categories',
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w700,color: Color(0xFF1B72C0)),),
        Spacer(),
        TextButton(
          onPressed: (){
            Navigator.pushNamed(context, AllCategoriesView.routeName);
          },
          child: Text('SEE ALL',
            style: Styles.textStyle12.copyWith(color: Color(0xFF44474E),fontWeight: FontWeight.w500),),

        ),

      ],
    );
  }
}
