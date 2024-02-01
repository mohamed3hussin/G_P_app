import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import '../../../core/assets_data/assetsData.dart';
import '../../home_screen/home_layout/home_screens/categories_screen/filtered_category_item.dart';

class BestSellingCategoryView extends StatelessWidget {

  List<String> images = [
    AssetsData.bestSellingProduct,
    AssetsData.bestSellingProduct,
    AssetsData.bestSellingProduct,
    AssetsData.bestSellingProduct,
    AssetsData.bestSellingProduct,
    AssetsData.bestSellingProduct,
    AssetsData.bestSellingProduct,
    AssetsData.bestSellingProduct,
  ];
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25.h,),
          Text('Best Selling:',style: Styles.textStyle20),
          SizedBox(
            height: 20.h,
          ),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 12,
            childAspectRatio: 1 / 1.65,
            children: List.generate(
                8,
                    (index) =>
                    FilteredCategoryItemBuilder(images[index], context)),
          ),
          SizedBox(height: 15.h,),
        ],
      ),
    );
  }
}
