import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cart-widget/cart_list_view.dart';
import 'cart-widget/check_out_bottun.dart';

class CartScreen extends StatefulWidget {
  static const String routeName='cart_screen';

   const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CartListView(),
        CheckoutBottun(context),
      ],
    );
  }

}
