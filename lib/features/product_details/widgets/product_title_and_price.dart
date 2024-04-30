import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/my_order/rate_product/rating_widget.dart';
import 'package:g_p_app/features/product_details/reviews_view.dart';
import '../../../core/colors/colors.dart';
import '../../../core/text_style/styles.dart';
import '../../../data/model/response/AllProductResponse.dart';

class ProductTitleLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args= ModalRoute.of(context)?.settings.arguments as Data;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              args.name??'',
              style: Styles.textStyle20!
                  .copyWith(color: CustomColors.blue, fontSize: 18),
            ),
            RatingWidget(rating: args.averageRate??0),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  args.price.toString(),
                  style: Styles.textStyle20!
                      .copyWith(color: CustomColors.green, fontSize: 18),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  (args.price!/0.8).toStringAsFixed(2),
                  style: Styles.textStyle14!.copyWith(
                      color: CustomColors.darkGrey,
                      decoration: TextDecoration.lineThrough),
                ),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: (){Navigator.pushNamed(context, ReviewsView.routeName,arguments: args);},
                  child: Text('View All Reviews',
                      style: Styles.textStyle14.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.black,
                          color: Colors.black)),
                ),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.black,
                  size: 15,
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
