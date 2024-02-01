import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/categories_screen/filtered_categories/collection_list.dart';

import '../../../../../../core/assets_data/assetsData.dart';
import '../filtered_category_item.dart';

class MenCategoryView extends StatelessWidget {
  List<CollectionModel> collectionModel = [
    CollectionModel(AssetsData.sportAvatar, 'Sport'),
    CollectionModel(AssetsData.sweatshirtAvatar, 'SweatShirts'),
    CollectionModel(AssetsData.jeansAvatar, 'Jeans'),
    CollectionModel(AssetsData.suitsAvatar, 'Suits'),
  ];
  List<String> images = [
    AssetsData.menProduct,
    AssetsData.menProduct,
    AssetsData.menProduct,
    AssetsData.menProduct,
    AssetsData.menProduct,
    AssetsData.menProduct,
    AssetsData.menProduct,
    AssetsData.menProduct,
  ];
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 15.h,),
          Container(
            height: 120.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    CollectionList(collectionModel[index]),
                separatorBuilder: (context, index) => SizedBox(
                      width: 15.w,
                    ),
                itemCount: collectionModel.length),
          ),
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
        ],
      ),
    );
  }
}
