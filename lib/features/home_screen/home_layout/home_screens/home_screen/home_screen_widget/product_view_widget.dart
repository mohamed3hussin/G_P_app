import 'package:flutter/material.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/home_screen/home_screen_widget/product_item_widget.dart';

Widget ProductViewWidget(context) => Container(
      color: Colors.white,
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 1 / 1.49,
        children: List.generate(8, (index) => ProductItemBuilder(context)),
      ),
    );
