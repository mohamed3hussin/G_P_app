import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/home_screen/design_screens/design_categories/unisex_design_category.dart';
import 'package:g_p_app/features/home_screen/design_screens/design_categories/women_design_category.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/categories_screen/filtered_categories/tab_item.dart';
import '../../../../core/assets_data/iconBroken.dart';
import '../../../../core/colors/colors.dart';
import '../../../../core/text_style/styles.dart';
import 'men_design_category.dart';

class DesignCategoriesView extends StatefulWidget {
  static const String routeName = 'design_categories';

  const DesignCategoriesView({super.key});

  @override
  State<DesignCategoriesView> createState() => _DesignCategoriesViewState();
}
class _DesignCategoriesViewState extends State<DesignCategoriesView> {
  int selectedIndex = 0;
  List<String> categoryList = ['men', 'women', 'unisex'];
  List<Widget> body=[const MenDesignCategoryView(),const WomenDesignCategoryView(),const UniSexDesignCategoryView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.h,
        backgroundColor: const Color(0xFFEFF1F8),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            IconBroken.Arrow___Left_2,
            color: CustomColors.blue,
          ),
        ),
        leadingWidth: 40.w,
        title: Text(
                  'Design',
                  style: Styles.textStyle24,
                ),
        titleSpacing: 4,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                IconBroken.Search,
                color: Color(0xFF1B72C0),
                size: 30,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                IconBroken.Buy,
                color: Color(0xFF1B72C0),
                size: 30,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 16.w,right: 10.w),
              height: 55.h,
              width: double.infinity,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  width: 8,
                ),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return TabItem(
                      onTap: () {
                        selectedIndex = index;
                        setState(() {});
                      },
                      name: categoryList[index],
                      isSelected: selectedIndex == index);
                },
                itemCount: categoryList.length,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: body[selectedIndex],
            )
          ],
        ),
      ),
    );
  }
}
