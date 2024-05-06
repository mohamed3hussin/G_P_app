import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_cubit.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/categories_screen/filtered_categories/men_category.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/categories_screen/filtered_categories/tab_container.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/categories_screen/filtered_categories/women_category.dart';

import '../../../../../../core/assets_data/iconBroken.dart';

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
    var cubit=HomeCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.h,
        backgroundColor: Color(0xFFEFF1F8),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            IconBroken.Arrow___Left_2,
            color: CustomColors.blue,
          ),
        ),
        title: Text(
          selectedIndex==0?'Men':'Women',
          style: Styles.textStyle24,
        ),
        centerTitle: true,
        titleSpacing: 4,
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
              icon: Stack(
                alignment: Alignment.topRight,
                children: [
                  Icon(
                    IconBroken.Buy,
                    color: Color(0xFF1B72C0),
                    size: 30,
                  ),
                  CircleAvatar(backgroundColor: Colors.red,
                    radius: 8,
                    child: Text('${cubit.listCartItems?.length==null?0:cubit.listCartItems?.length}', style: TextStyle(
                        fontSize: 10.sp),),),
                ],
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
              SizedBox(height: 15.h,),
            ],
          ),
        ),
      ),
    );
  }
}
