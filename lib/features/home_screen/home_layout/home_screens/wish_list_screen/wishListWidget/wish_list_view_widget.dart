import 'package:flutter/material.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/wish_list_screen/wishListWidget/wish_list_item_widget.dart';

import '../../../../../../data/model/response/WishListModel.dart';
import '../../../../../product_details/product_details_view.dart';

Widget WishListViewWidget(BuildContext context, List<WishListItem> model) => InkWell(
  onTap: () {
    Navigator.pushNamed(context, ProductDetailsView.routeName);
  },
  child: Container(
    color: Colors.white,
    child: GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: 1 / 1.24
      ,
      children: List.generate(
        model!.length,
            (index) => WishListItemBuilder(context, model![index]),
      ),
    ),
  ),
);
