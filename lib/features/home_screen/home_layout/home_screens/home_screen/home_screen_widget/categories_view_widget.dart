import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../categories_screen/filtered_categories/filtered_category_screen_view.dart';
import 'categories_list_widget.dart';

Widget CategoriesViewWidget(List<CategoriesModel> categoriesModel) => Container(
  margin: EdgeInsets.symmetric(horizontal: 45.w,vertical: 10.h),
      height: 130,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.pushNamed(
                    context, FilteredCategoryScreenView.routeName,
                    arguments: index);
              },
              child: CategoriesListWidget(categoriesModel[index])),
          separatorBuilder: (context, index) => const SizedBox(
                width: 70,
              ),
          itemCount: categoriesModel.length),
    );
