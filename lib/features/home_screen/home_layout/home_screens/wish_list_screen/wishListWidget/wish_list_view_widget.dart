import 'package:flutter/material.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/wish_list_screen/wishListWidget/wish_list_item_widget.dart';

Widget WishListViewWidget(context)=>Container(
  color: Colors.white,
  child: GridView.count(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    crossAxisCount: 2,
    mainAxisSpacing: 8,
    crossAxisSpacing: 8,
    childAspectRatio: 1/1.12,
    children: List.generate(
        9,
            (index) => WishListItemBuilder(context)),
  ),
);