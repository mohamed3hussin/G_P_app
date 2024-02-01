import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/home_screen/home_screen_widget/carousel_slider_widget.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/home_screen/home_screen_widget/categories_list_widget.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/home_screen/home_screen_widget/for_you_line.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/home_screen/home_screen_widget/product_item_widget.dart';
import 'home_screen_widget/categories_line.dart';
import 'home_screen_widget/categories_view_widget.dart';
import 'home_screen_widget/design_containar.dart';
import 'home_screen_widget/product_view_widget.dart';

class HomeScreen extends StatelessWidget {

  List<CategoriesModel> categoriesModel = [
    CategoriesModel(AssetsData.manCategoriesImage, 'Man'),
    CategoriesModel(AssetsData.womenCategoriesImage, 'Women'),
  ];

   HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CarouselSliderWidget(),
            const DesignContainer(),
            SizedBox(height: 5.h,),
            const CategoriesLine(),
            CategoriesViewWidget(categoriesModel),
            const ForYouLine(),
            ProductViewWidget(context),
          ],
        ),
      ),
    );
  }
}
