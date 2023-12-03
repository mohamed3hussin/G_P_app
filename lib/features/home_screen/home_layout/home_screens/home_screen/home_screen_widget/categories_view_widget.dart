import 'package:flutter/material.dart';

import 'categories_list_widget.dart';

Widget CategoriesViewWidget(List<CategoriesModel> categoriesModel)=>Container(
  height: 130,
  child: ListView.separated(
      physics:BouncingScrollPhysics() ,
      scrollDirection: Axis.horizontal,
      itemBuilder:(context,index)=> CategoriesListWidget(categoriesModel[index]),
      separatorBuilder: (context,index)=>SizedBox(width: 10,),
      itemCount: categoriesModel.length
  ),
);