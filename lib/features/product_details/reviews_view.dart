import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/product_details/widgets/review_item.dart';

import '../../core/assets_data/iconBroken.dart';

class ReviewsView extends StatelessWidget {
  static const String routeName = 'reviews';

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
          'Reviews',
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
          child: Column(
            children: [
              ReviewItem(),
              ReviewItem(),
              ReviewItem(),
              ReviewItem(),
              ReviewItem(),
            ],
          ),
        ),
      ),
    );
  }
}
