import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/categories_screen/filtered_categories/men_category.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/categories_screen/filtered_categories/tab_container.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/categories_screen/filtered_categories/women_category.dart';

class FilteredCategoryScreenView extends StatefulWidget {
  static const String routeName = 'filtered_categories';

  @override
  State<FilteredCategoryScreenView> createState() =>
      _FilteredCategoryScreenViewState();
}

class _FilteredCategoryScreenViewState
    extends State<FilteredCategoryScreenView> {
  int selectedIndex = 0;
  bool isTabIndexSet = false;

  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isTabIndexSet) {
      final arguments = ModalRoute.of(context)?.settings.arguments;
      if (arguments is int) {
        setState(() {
          selectedIndex = arguments;
          isTabIndexSet = true;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedIndex == 0 ? 'Men' : 'Women'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabContainer(
                onIndexChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                selectedIndex == 0
                    ? 'Men\'s collection'
                    : 'Women\'s collection',
                style: Styles.textStyle16!.copyWith(
                    color: CustomColors.blue, fontWeight: FontWeight.bold),
              ),
              selectedIndex == 0 ? MenCategoryView() : WomenCategoryView(),
            ],
          ),
        ),
      ),
    );
  }
}
