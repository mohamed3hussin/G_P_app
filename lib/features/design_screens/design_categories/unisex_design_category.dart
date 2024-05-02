import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/categories_screen/filtered_categories/collection_list.dart';
import '../../../../../../core/assets_data/assetsData.dart';
import '../../../core/colors/colors.dart';
import '../../home_screen/home_layout/home_cubit/home_cubit.dart';
import '../../home_screen/home_layout/home_cubit/home_state.dart';
import '../../home_screen/home_layout/home_screens/categories_screen/filtered_category_item.dart';

class UniSexDesignCategoryView extends StatefulWidget {
  @override
  State<UniSexDesignCategoryView> createState() => _WomenDesignCategoryViewState();
}

class _WomenDesignCategoryViewState extends State<UniSexDesignCategoryView> {
  List<CollectionModel> collectionModel = [
    CollectionModel(AssetsData.menSleeve, 'Sleeve'),
    CollectionModel(AssetsData.womenTShirt, 'T-shirt'),
  ];

  bool isSelectedOne=true;
  bool isSelectedTwo=false;
  @override
  void initState() {
    // TODO: implement initState
    final cubit = BlocProvider.of<HomeCubit>(context);
    cubit.getGenderProductByTypeId(typeId: '8', gender: 'Unisex',isDesigned: 'true');
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
                          cubit.getGenderProductByTypeId(typeId: '8',gender: 'Unisex',isDesigned: 'true');
                        },
                        child: CollectionList(collectionModel[0],isSelectedOne)),
                    SizedBox(
                      width: 10.w,
                    ),
                    GestureDetector(onTap: (){
                      isSelectedOne=false;
                      isSelectedTwo=true;
                      cubit.getGenderProductByTypeId(typeId: '6',gender: 'Unisex',isDesigned: 'true');
                    },child: CollectionList(collectionModel[1],isSelectedTwo)),
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
                            FilteredCategoryItemBuilder(data: cubit.listProductsByGender![index],isDesignable: true,)),
                  ),
                  fallback: (context) => Center(child: CircularProgressIndicator(color: CustomColors.blue,)),
                ),
              ],
            ),
          );
        });
  }
}