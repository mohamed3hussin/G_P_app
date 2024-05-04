import 'package:flutter/material.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/wish_list_screen/wish_list_view.dart';
import 'no_item_wish.dart';

class WishListScreen extends StatelessWidget {
  bool wish = false;
  WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return wish? noItemWish():WishListView();
  }
}