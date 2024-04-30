import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_cubit.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/home_screen/home_screen_widget/product_item_widget.dart';

import '../../home_cubit/home_state.dart';

class SeeAllProductsScreen extends StatelessWidget {
  static const String routeName = '/see_all_products';
  final data;

  SeeAllProductsScreen({this.data});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) => {},
      builder: (context, state){
        var cubit=HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('See All Products'),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: Container(
                color: Colors.white,
                child: GridView.count(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1 / 1.65,
                  children: List.generate(cubit.allProducts!.data!.length,
                          (index) => ProductItemBuilder(context, cubit.allProducts!.data![index])),
                )),
          ),
        );
      } ,
    );
  }
}

// return Padding(
// padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
// child: Container(
// color: Colors.white,
// child: GridView.count(
// shrinkWrap: true,
// physics: BouncingScrollPhysics(),
// crossAxisCount: 2,
// mainAxisSpacing: 8,
// crossAxisSpacing: 8,
// childAspectRatio: 1 / 1.65,
// children: List.generate(
// state.allProductResponse.data!.length,
// (index) => ProductItemBuilder(
// context, state.allProductResponse.data![index])),
// )),
// );
