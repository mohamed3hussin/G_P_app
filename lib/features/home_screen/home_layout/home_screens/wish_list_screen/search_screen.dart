import 'package:flutter/material.dart';

import '../../../../../core/text_style/styles.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Wish List Screen',style: Styles.textStyle32,)
      ],
    );
  }
}