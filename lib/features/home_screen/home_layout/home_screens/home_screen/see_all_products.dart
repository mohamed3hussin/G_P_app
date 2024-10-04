import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_cubit.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/home_screen/home_screen_widget/product_item_widget.dart';

import '../../../../../data/model/response/AllProductResponse.dart';
import '../../home_cubit/home_state.dart';

class SeeAllProductsScreen extends StatelessWidget {
  static const String routeName = '/see_all_products';

  const SeeAllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)?.settings.arguments as StatesEnum;
    var cubit = HomeCubit.get(context);

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) => {},
      builder: (context, state) {
        List<Data> data = selectSeeAllScreenContent(args,cubit);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Products'),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: ConditionalBuilder(
              condition: args !=null,
              builder: (context) => Container(
                  color: Colors.white,
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1 / 1.65,
                    children: List.generate(data.length,
                        (index) => ProductItemBuilder(data[index])),
                  )),
              fallback: (context) => Center(
                child: CircularProgressIndicator(
                  color: CustomColors.blue,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

enum StatesEnum { forYou, newArrival, bestSelling }

List<Data> selectSeeAllScreenContent(StatesEnum states,HomeCubit cubit) {
  switch (states) {
    case StatesEnum.forYou:
      return cubit.allProducts?.data ?? [];
    case StatesEnum.newArrival:
      return cubit.newArrival?.data ?? [];
    case StatesEnum.bestSelling:
      return cubit.bestSelling ?? [];
  }
}