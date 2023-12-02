import 'package:flutter/material.dart';
import 'package:g_p_app/core/text_style/styles.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Cart Screen',style: Styles.textStyle32,)
      ],
    );
  }
}