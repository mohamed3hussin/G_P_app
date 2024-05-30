import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/data/model/response/AllOrdersResponse.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_cubit.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_state.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/my_order/rate_product/rating_widget.dart';

import '../../../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../../../core/text_style/styles.dart';

class RateProductView extends StatefulWidget {
  static const String routeName = 'rate_product';

  @override
  State<RateProductView> createState() => _RateProductViewState();
}

class _RateProductViewState extends State<RateProductView> {
  var commentController = TextEditingController();

  int userRating=1;
@override
  void dispose() {
    // TODO: implement dispose
    commentController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Items;
    return BlocConsumer<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 90.h,
            backgroundColor: Color(0xFFEFF1F8),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                IconBroken.Arrow___Left_2,
                color: CustomColors.blue,
              ),
            ),
            leadingWidth: 40.w,
            title: Text(
              'My Order',
              style: Styles.textStyle24,
            ),
            titleSpacing: 4,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Container(
                  width: 150.w,
                  height: 220.h,
                  child: Column(
                    children: [
                      args.pictureUrl != null && args.pictureUrl!.isNotEmpty
                          ? Container(clipBehavior: Clip.antiAliasWithSaveLayer,
                        width: 120,
                        height: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            image: DecorationImage(image: NetworkImage(
                              args.pictureUrl![0].pictureUrl!
                            ),)
                        ),
                      )
                          : Container(width: 120,height:130,child: Icon(Icons.error, size: 30)),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        args.productName ?? '',
                        style: Styles.textStyle16,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: CustomColors.yellow,
                        ),
                        onRatingUpdate: (rating) {
                          userRating=rating.toInt();
                          print(rating);
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add Description',
                        style: Styles.textStyle16,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        height: 160.h,
                        child: TextFormField(
                          controller: commentController,
                          textAlign: TextAlign.center,
                          maxLines: null,
                          expands: true,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                              hintText: 'Type your opinion here.',
                              hintStyle: Styles.textStyle16!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ))),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Center(
                        child: Container(
                          width: 325.w,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: () {
                              cubit.createReview(rate: userRating, id: args.productId!, comment: commentController.text);
                              print(args.id);
                            },
                            child: Text(
                              'Submit Feedback',
                              style: Styles.textStyle20!
                                  .copyWith(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: CustomColors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
