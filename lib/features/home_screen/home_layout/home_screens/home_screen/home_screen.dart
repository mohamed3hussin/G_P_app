import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_state.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/home_screen/home_screen_widget/carousel_slider_widget.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/home_screen/home_screen_widget/categories_list_widget.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/home_screen/home_screen_widget/for_you_line.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/home_screen/home_screen_widget/new_arrival_line.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/home_screen/see_all_products.dart';
import '../../home_cubit/home_cubit.dart';
import 'home_screen_widget/best_selling_line.dart';
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
    final cubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context, state) => {},
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CarouselSliderWidget(),
                const DesignContainer(),
                SizedBox(
                  height: 5.h,
                ),
                const CategoriesLine(),
                CategoriesViewWidget(categoriesModel),
                ForYouLine(() {
                  Navigator.pushNamed(context, SeeAllProductsScreen.routeName,
                      arguments: cubit..getAllProduct());
                }),
                ProductViewWidget(context, cubit: cubit..getAllProduct()),
                SizedBox(
                  height: 20.h,
                ),
                NewArrivalLine(() {
                  Navigator.pushNamed(context, SeeAllProductsScreen.routeName,
                      arguments: cubit..getAllProduct(sort: 'DateOfCreation'));
                }),
                ProductViewWidget(context,
                    cubit: cubit..getAllProduct(sort: 'DateOfCreation'),
                    sort: 'DateOfCreation'),
                SizedBox(
                  height: 20.h,
                ),
                BestSellingLine(() {
                  Navigator.pushNamed(context, SeeAllProductsScreen.routeName,
                      arguments: cubit..getBestSellingProduct());
                }),
                bestProductViewWidget(context),
                SizedBox(
                  height: 80.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
