import 'package:flutter/material.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/dashboard/widget/drawer.dart';
import 'package:g_p_app/features/dashboard/widget/product_item.dart';
import 'package:g_p_app/features/dashboard/widget/search_field.dart';

class ProductDashboard extends StatelessWidget {
  static const String routeName='product_dashboard_view';

  @override
  Widget build(BuildContext context) {
    return Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  ProductItem(),
                  ProductItem(),
                  ProductItem(),
                  ProductItem(),
                  ProductItem(),
                  ProductItem(),
                  ProductItem(),
                  ProductItem(),
                  ProductItem(),
                ],
              ),
            ),
          );
  }
}
