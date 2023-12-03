import 'package:flutter/material.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/cart_screen/no_item.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/cart_screen/order_success.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrderSuccessView();
  }
}
