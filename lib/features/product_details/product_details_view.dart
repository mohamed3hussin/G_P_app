import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/assets_data/iconBroken.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/features/product_details/widgets/buttons_row.dart';
import 'package:g_p_app/features/product_details/widgets/color_line.dart';
import 'package:g_p_app/features/product_details/widgets/product_counter.dart';
import 'package:g_p_app/features/product_details/widgets/product_description.dart';
import 'package:g_p_app/features/product_details/widgets/product_title_and_price.dart';
import 'package:g_p_app/features/product_details/widgets/size_line.dart';

class ProductDetailsView extends StatelessWidget {
  static const String routeName = 'product_details';
  List<String> sliderImages = [
    AssetsData.productDetails1,
    AssetsData.productDetails2,
    AssetsData.productDetails3
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(IconBroken.Arrow___Left),
        ),
        leadingWidth: 40.w,
        title: Text(
                  'Product Details',
                ),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  color: CustomColors.lightGrey,
                  width: MediaQuery.sizeOf(context).width,
                  height: 280.h,
                  child: ImageSlideshow(
                    initialPage: 0,
                    indicatorColor: CustomColors.blue,
                    indicatorBottomPadding: 20.h,
                    indicatorRadius: 5,
                    isLoop: true,
                    children: sliderImages
                        .map((url) => Align(
                              alignment: Alignment.bottomCenter,
                              child: Image.asset(
                                url,
                              ),
                            ))
                        .toList(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.r),
                  child: CircleAvatar(
                    radius: 20.w,
                    backgroundColor: Colors.white,
                    child: Icon(
                      IconBroken.Heart,
                      color: Color(0xFFEA3A3D),
                      size: 30.w,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.all(10.h),
                      width: 35.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                          color: CustomColors.lightGrey,
                          borderRadius: BorderRadius.circular(3.r)),
                    ),
                  ),
                  ProductTitleLine(),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizeLine(),
                  SizedBox(
                    height: 20.h,
                  ),
                  ColorLine(),
                  SizedBox(
                    height: 35.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductDescription(),
                      SizedBox(
                        height: 40.h,
                      ),
                      ProductCounter(),
                      ButtonsRow()
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
