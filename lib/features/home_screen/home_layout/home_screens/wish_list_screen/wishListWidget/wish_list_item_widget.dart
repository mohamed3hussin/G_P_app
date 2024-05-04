import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/data/model/response/WishListModel.dart';
import 'package:g_p_app/features/product_details/product_details_view.dart';

import '../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../core/text_style/styles.dart';

Widget WishListItemBuilder(context, WishListItem model) => InkWell(
    onTap: () {
      Navigator.pushNamed(context, ProductDetailsView.routeName);
    },
    child: Container(
      width: 150.w,
      child: Material(
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 1,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Colors.grey, width: 1)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(
                    height: 140.h,
                    child: Image.network(
                      model.pictureUrl ?? '',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: CircleAvatar(
                        radius: 20.w,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          Icons.favorite,
                          color: Color(0xFFEA3A3D),
                          size: 30.w,
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 15.w, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${model.productName}',
                        style: Styles.textStyle14.copyWith(
                            color: CustomColors.textColor,
                            fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Text('\$ ${model.price}',
                            style: Styles.textStyle16.copyWith(
                                color: CustomColors.green,
                                fontWeight: FontWeight.w600)),
                        SizedBox(
                          width: 2.w,
                        ),
                        // Text(
                        //   '\$ ${model.price!-20}',
                        //   style: Styles.textStyle12.copyWith(color: Colors.grey,decoration: TextDecoration.lineThrough),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
