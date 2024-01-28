import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/categories_screen/filtered_categories/filtered_category_screen_view.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/categories_screen/filtered_category_item.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/home_screen/home_screen_widget/categories_list_widget.dart';
import '../../../../../core/assets_data/assetsData.dart';
import '../../../../../core/assets_data/iconBroken.dart';
import '../../../../../core/text_style/styles.dart';

class AllCategoriesView extends StatelessWidget {
  static const String routeName = 'all_categories';
  int selectedIndex=0;
  List<CategoriesModel> categoriesModel = [
    CategoriesModel(AssetsData.manCategoriesImage, 'Man'),
    CategoriesModel(AssetsData.womenCategoriesImage, 'Women'),
  ];
  List<String> images = [
    AssetsData.womenProduct,
    AssetsData.menProduct,
    AssetsData.menProduct,
    AssetsData.menProduct,
    AssetsData.womenProduct,
    AssetsData.menProduct,
    AssetsData.womenProduct,
    AssetsData.womenProduct,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(IconBroken.Arrow___Left),
        ),
        leadingWidth: 40.w,
        title: Center(
            child: Text(
          'Categories',
                style: Styles.textStyle24
        )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                IconBroken.Search,
                color: Color(0xFF1B72C0),
                size: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                IconBroken.Buy,
                color: Color(0xFF1B72C0),
                size: 30,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        selectedIndex = 0;
                        Navigator.pushNamed(
                            context, FilteredCategoryScreenView.routeName,
                            arguments: selectedIndex);
                      },
                      child: CategoriesListWidget(categoriesModel[0])),
                  SizedBox(
                    width: 75.w,
                  ),
                  InkWell(
                      onTap: () {
                        selectedIndex=1;
                        Navigator.pushNamed(
                            context, FilteredCategoryScreenView.routeName,arguments: selectedIndex);
                      },
                      child: CategoriesListWidget(categoriesModel[1])),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text('New Arrival: ',
                  style:
                      Styles.textStyle20!.copyWith(color: CustomColors.blue)),
              SizedBox(
                height: 25.h,
              ),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 12,
                childAspectRatio: 1 / 1.70,
                children: List.generate(
                    8,
                    (index) =>
                        FilteredCategoryItemBuilder(images[index], context)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
