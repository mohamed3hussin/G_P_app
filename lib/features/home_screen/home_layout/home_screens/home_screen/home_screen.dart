import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/colors/colors.dart';
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
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit=HomeCubit.get(context);
          return ConditionalBuilder(
            condition: cubit.allProducts!=null && cubit.newArrival !=null && cubit.bestSelling !=null,
            builder:(context)=> SingleChildScrollView(
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
                    ProductViewWidget(context,cubit.allProducts!),
                    SizedBox(
                      height: 20.h,
                    ),
                    NewArrivalLine(() {
                      Navigator.pushNamed(context, SeeAllProductsScreen.routeName,);
                    }),
                    ProductViewWidget(context, cubit.newArrival!),
                    SizedBox(
                      height: 20.h,
                    ),
                    BestSellingLine(() {
                      Navigator.pushNamed(context, SeeAllProductsScreen.routeName,
                          arguments: cubit..getBestSellingProduct());
                    }),
                    bestSellingProductViewWidget(context,cubit.bestSelling!),
                    SizedBox(
                      height: 80.h,
                    ),
                  ],
                ),
              ),
            ),
            fallback: (context) => Center(child: CircularProgressIndicator(color: CustomColors.blue,)),
          );
        });
  }
}
