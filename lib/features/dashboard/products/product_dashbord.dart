import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/dashboard/dashBoardCubit/dash_board_cubit.dart';
import 'package:g_p_app/features/dashboard/dashBoardCubit/dash_board_state.dart';
import 'package:g_p_app/features/dashboard/products/designed_product_view.dart';
import 'package:g_p_app/features/dashboard/products/tab_container_admin_dashboard.dart';
import 'package:g_p_app/features/dashboard/products/un_designed_product_view.dart';
import 'package:g_p_app/features/dashboard/widget/drawer.dart';
import 'package:g_p_app/features/dashboard/widget/product_item.dart';
import 'package:g_p_app/features/dashboard/widget/search_field.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_cubit.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_state.dart';

import '../../../core/assets_data/assetsData.dart';
import '../../home_screen/home_layout/home_screens/categories_screen/filtered_categories/tab_container.dart';
import '../widget/delete_alert.dart';
import '../widget/edit_item.dart';

class ProductDashboard extends StatefulWidget {
  static const String routeName = 'product_dashboard_view';

  @override
  State<ProductDashboard> createState() => _ProductDashboardState();
}

class _ProductDashboardState extends State<ProductDashboard> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabContainerDashBoard(
          onIndexChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
        SizedBox(height: 20.h,),
        selectedIndex == 0 ? DesignedProductDashboard() : UnDesignedProductDashboard(),
      ],
    );
  }
}
