import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import '../../core/assets_data/iconBroken.dart';
import '../../core/colors/colors.dart';
import '../../core/text_style/styles.dart';
import '../../data/model/response/AllProductResponse.dart';
import '../home_screen/home_layout/home_screens/profile_screen/account/my_order/rate_product/rating_widget.dart';

class ReviewsView extends StatelessWidget {
  static const String routeName = 'reviews';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Data;
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
        body: ConditionalBuilder(
          condition: args.reviews != null && args.reviews!.isNotEmpty,
          builder: (context) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(12.r),
                        margin: EdgeInsets.only(bottom: 10.h),
                        width: 330,
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: CustomColors.lightGrey, width: 2),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFD9D9D9),
                                    shape: OvalBorder(),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Container(
                              width: 170.w,
                              child: Column(
                                children: [
                                  Text(
                                    args.reviews![index].userEmail ?? '',
                                    style: Styles.textStyle14,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    args.reviews![index].comments![0] ?? '',
                                    style: Styles.textStyle12,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                RatingWidget(
                                  rating: args.reviews![index].rate!.toDouble(),
                                  size: 15,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      height: 5.h,
                    ),
                    itemCount: args.reviews!.length,
                  ),
                ),
              ],
            ),
          ),
          fallback: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AssetsData.sadRobotImage,width: 120.w),
                Text(
                  'Oops! there is no \n reviews for this\n product!',
                  style: Styles.textStyle24.copyWith(color: CustomColors.blue,),textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ));
  }
}
