import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_cubit.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_state.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/cart_screen/no_item.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/wish_list_screen/no_item_wish.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/wish_list_screen/wishListWidget/wish_list_view_widget.dart';

class WishListScreen extends StatefulWidget {


  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  void initState() {
    var cubit=BlocProvider.of<HomeCubit>(context);
    cubit.getWishList();
    cubit.getAllProduct();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit=BlocProvider.of<HomeCubit>(context);
        return ConditionalBuilder(
          condition: cubit.listWishList != null && cubit.listWishList!.isNotEmpty,
          builder: (context) => SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WishListViewWidget(context, cubit.listWishList!,cubit.bestSelling),
                ],
              ),
            ),
          ),
          fallback: (context) => noItemWish(),
        );
      },
    );
  }
}
