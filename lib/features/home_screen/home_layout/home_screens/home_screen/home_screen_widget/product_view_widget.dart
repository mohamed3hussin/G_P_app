import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/data/model/response/AllProductResponse.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/home_screen/home_screen_widget/product_item_widget.dart';
import '../../../home_cubit/home_cubit.dart';
import '../../../home_cubit/home_state.dart';

var cubit=HomeCubit();
Widget ProductViewWidget(BuildContext context,AllProducts data) => Container(
  height: 300.h,
  child: ListView.separated(
    physics: BouncingScrollPhysics(),
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      return ProductItemBuilder(data.data![index]);
    },
    itemCount: data.data!.length,
    separatorBuilder: (BuildContext context, int index) => SizedBox(
      width: 15.h,
    ),
  ),
);

Widget bestSellingProductViewWidget(BuildContext context,List<Data> bestSelling) => Container(
  height: 300.h,
  child: ListView.separated(
    physics: BouncingScrollPhysics(),
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      return ProductItemBuilder(bestSelling![index]);
    },
    itemCount: bestSelling!.length,
    separatorBuilder: (BuildContext context, int index) => SizedBox(
      width: 15.h,
    ),
  ),
);

