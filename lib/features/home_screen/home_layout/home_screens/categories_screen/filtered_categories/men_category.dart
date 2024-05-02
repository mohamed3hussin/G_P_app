import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/categories_screen/filtered_categories/collection_list.dart';

import '../../../../../../core/assets_data/assetsData.dart';
import '../../../../../../core/colors/colors.dart';
import '../../../home_cubit/home_cubit.dart';
import '../../../home_cubit/home_state.dart';
import '../filtered_category_item.dart';

class MenCategoryView extends StatefulWidget {
  @override
  State<MenCategoryView> createState() => _MenCategoryViewState();
}

class _MenCategoryViewState extends State<MenCategoryView> {
  bool isSelectedOne=true;
  bool isSelectedTwo=false;
  bool isSelectedThree=false;
  List<CollectionModel> collectionModel = [
    CollectionModel(AssetsData.jeansAvatar, 'Jeans'),
    CollectionModel(AssetsData.suitsAvatar, 'Suits'),
    CollectionModel(AssetsData.sportAvatar, 'Sport')
  ];
  @override
  void initState() {
    // TODO: implement initState
    final cubit = BlocProvider.of<HomeCubit>(context);
    cubit.getGenderProductByTypeId(typeId: '3', gender: 'Male');
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BlocProvider.of<HomeCubit>(context);
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          isSelectedOne=true;
                          isSelectedTwo=false;
                          isSelectedThree=false;
                          cubit.getGenderProductByTypeId(typeId: '3',gender: 'Male');
                        },
                        child: CollectionList(collectionModel[0],isSelectedOne)),
                    SizedBox(
                      width: 10.w,
                    ),
                    GestureDetector(onTap: (){
                      isSelectedOne=false;
                      isSelectedTwo=true;
                      isSelectedThree=false;
                      cubit.getGenderProductByTypeId(typeId: '5',gender: 'Male');
                    },child: CollectionList(collectionModel[1],isSelectedTwo)),
                    SizedBox(
                      width: 10.w,
                    ),
                    GestureDetector(onTap: (){
                      isSelectedOne=false;
                      isSelectedTwo=false;
                      isSelectedThree=true;
                      cubit.getGenderProductByTypeId(typeId: '4',gender: 'Unisex');
                    },child: CollectionList(collectionModel[2],isSelectedThree)),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                ConditionalBuilder(
                  condition: cubit.listProductsByGender!.length !=0,
                  builder: (context) =>GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1 / 1.65,
                    children: List.generate(
                        cubit.listProductsByGender!.length,
                            (index) =>
                            FilteredCategoryItemBuilder(data: cubit.listProductsByGender![index])),
                  ),
                  fallback: (context) => Center(child: CircularProgressIndicator(color: CustomColors.blue,)),
                ),
              ],
            ),
          );
        });
  }
}
