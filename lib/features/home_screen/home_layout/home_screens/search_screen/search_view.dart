import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/iconBroken.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';

import '../../../../../core/app_theme/application_theme.dart';
import '../../home_cubit/home_cubit.dart';
import '../../home_cubit/home_state.dart';
import '../home_screen/home_screen_widget/product_item_widget.dart';
class SearchView extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: ()=>showResults(context), icon:Icon(Icons.search))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(IconBroken.Arrow___Left));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    if(query.isEmpty){
      return Center(child: Text('Oops!\n no results!',style: Styles.textStyle32.copyWith(color: CustomColors.blue),textAlign: TextAlign.center,),);
    }
    return BlocConsumer<HomeCubit,HomeState>(builder: (context, state) {
      var cubit=HomeCubit.get(context)..getSearch(search: query);
      if(query.isEmpty){
        cubit.searchResults!.data=[];
      }
      return cubit.searchResults!.data!.isNotEmpty && cubit.searchResults?.data !=null?
       Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.count(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1 / 1.67,
              children: List.generate(cubit.searchResults!.data!.length,
                      (index) => ProductItemBuilder(cubit.searchResults!.data![index])),
            ),
          )):Center(child: Text('Oops!\n no results!',style: Styles.textStyle32.copyWith(color: CustomColors.blue),textAlign: TextAlign.center,),);

    }, listener: (context, state) {

    },);
  }
  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return ApplicationTheme.lightTheme.copyWith(inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      focusColor: Colors.white,
      labelStyle: Styles.textStyle16,
      contentPadding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: CustomColors.blue),
      ),
      focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: CustomColors.blue,width: 2)
    ),
    ));
  }
}
