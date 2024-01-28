import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/assets_data/iconBroken.dart';
import '../../../core/colors/colors.dart';
import '../../../core/text_style/styles.dart';

class DesignCategoriesView extends StatefulWidget {
  static const String routeName='design_categories';
  @override
  State<DesignCategoriesView> createState() => _DesignCategoriesViewState();
}

class _DesignCategoriesViewState extends State<DesignCategoriesView> {
  int selectedIndex = 0;
  List<String> categoryList=['best selling','men','women','unisex'];
  @override
  Widget build(BuildContext context) {
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
        leadingWidth: 40.w,
        title: Center(
            child: Text(
              'Design',
              style: Styles.textStyle24,
            )),
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
              icon: Icon(
                IconBroken.Buy,
                color: Color(0xFF1B72C0),
                size: 30,
              ))
        ],
      ),
      body: Column(children: [],),
    );
  }
}
