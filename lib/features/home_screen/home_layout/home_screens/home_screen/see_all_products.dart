import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_cubit.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/home_screen/home_screen_widget/product_item_widget.dart';

import '../../home_cubit/home_state.dart';

class SeeAllProductsScreen extends StatelessWidget {
  static const String routeName = '/see_all_products';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HomeCubit;
    return Scaffold(
      appBar: AppBar(
        title: Text('See All Products'),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: args,
        builder: (context, state) {
          if (state is BestSellingProductsLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is BestSellingProductsLoadedState) {
            return Padding(
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
                    children: List.generate(
                        state.data!.length,
                        (index) =>
                            ProductItemBuilder(context, state.data![index])),
                  )),
            );
          } else if (state is BestSellingProductsErrorState) {
            return Center(
              child: Text('Error: ${state.errorMessage}'),
            );
          }
          if (state is AllProductLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AllProductLoadedState) {
            return Padding(
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
                    children: List.generate(
                        state.allProductResponse.data!.length,
                        (index) => ProductItemBuilder(
                            context, state.allProductResponse.data![index])),
                  )),
            );
          } else if (state is AllProductErrorState) {
            return Center(
              child: Text('Error: ${state.errorMessage}'),
            );
          }
          return Container();
        },
      ),
    );
  }
}
