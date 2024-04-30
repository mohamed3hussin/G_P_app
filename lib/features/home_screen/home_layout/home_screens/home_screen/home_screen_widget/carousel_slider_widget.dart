import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/assets_data/assetsData.dart';

class CarouselSliderWidget extends StatelessWidget {
  List<String> carouselList = [
    '${AssetsData.carouselImage}',
    '${AssetsData.carouselImage2}',
    '${AssetsData.carouselImage3}',
  ];
   CarouselSliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(vertical: 10.h),
      child: CarouselSlider(
        items: carouselList.map((e) =>
            Container(

              child: Image(image: AssetImage('${e.toString()}'),
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            )).toList(), options: CarouselOptions(
        autoPlay: true,
        height: 185.h,
        initialPage: 0,
        viewportFraction: 1.0,
        enableInfiniteScroll: false,
        reverse: false,
        scrollDirection: Axis.horizontal,

      ) ,
      ),
    );
  }
}
