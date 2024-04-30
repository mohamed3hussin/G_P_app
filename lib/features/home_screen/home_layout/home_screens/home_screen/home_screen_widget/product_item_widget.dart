import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/data/model/response/AllProductResponse.dart';
import 'package:g_p_app/features/product_details/product_details_view.dart';
import '../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../core/text_style/styles.dart';

Widget ProductItemBuilder(context, Data data) => InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsView.routeName);
      },
      child: Container(
        width: 150.w,
        child: Material(
          borderRadius: BorderRadius.circular(12),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Container(
                    height: 150.h,
                    width: 155.h,
                    child: Image.network(
                      data.productPictures?[0] ?? '',
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              color: CustomColors.blue,
                            ),
                          );
                        }
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.error);
                      },
                    ),
                  ),
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: CircleAvatar(
                        radius: 20.w,
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                          IconBroken.Heart,
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
                padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.name ?? '',
                        style: Styles.textStyle12.copyWith(
                            color: Color(0xFF1B72C0),
                            fontWeight: FontWeight.w500)),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(data.price.toString() ?? '',
                        style: Styles.textStyle14.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w500)),
                    Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          (data.price!/0.8).toStringAsFixed(2),
                          style: Styles.textStyle12.copyWith(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                        Text('20% OFF',
                            style: Styles.textStyle14.copyWith(
                                color: Color(0xFF117828),
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            CircleAvatar(
                              radius: 6.0.w,
                              backgroundColor: Colors.black,
                            ),
                            CircleAvatar(
                              radius: 5.0.w,
                              backgroundColor: Colors.white,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        CircleAvatar(
                          radius: 6.0.w,
                          backgroundColor: Colors.blueAccent,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        CircleAvatar(
                          radius: 6.0.w,
                          backgroundColor: Colors.amber,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        CircleAvatar(
                          radius: 6.0.w,
                          backgroundColor: Colors.green,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          double.parse(data.averageRate!.toStringAsFixed(2)).toString() ?? '',
                          style: Styles.textStyle12.copyWith(
                              color: Colors.black, fontWeight: FontWeight.w400),
                        ),
                        Spacer(),
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: CircleAvatar(
                              radius: 20.w,
                              backgroundColor: Color(0xFF1B72C0),
                              child: Icon(
                                IconBroken.Bag_2,
                                color: Colors.white,
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
