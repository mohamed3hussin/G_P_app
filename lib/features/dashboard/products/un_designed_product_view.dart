import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/colors/colors.dart';
import '../../../core/text_style/styles.dart';
import '../dashBoardCubit/dash_board_cubit.dart';
import '../dashBoardCubit/dash_board_state.dart';
import '../widget/delete_alert.dart';
import '../widget/edit_item.dart';

class UnDesignedProductDashboard extends StatelessWidget {
  const UnDesignedProductDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit, DashBoardState>(
      builder: (context, state) {
        var cubit = DashBoardCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.allProducts != null,
          builder: (context){return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  width: 340,
                  height: 80,
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                  margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: CustomColors.lightGrey,
                  ),
                  child: Row(
                    children: [
                      Text(
                        '${index + 1}',
                        style: Styles.textStyle14,
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 42,
                        height: 42,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage(cubit.allProducts?.data?[index]
                                .productPictures?[0] ??
                                ''),
                            fit: BoxFit.cover,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 6.w,
                                ),
                                Text(
                                  cubit.allProducts?.data?[index].name ?? '',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Styles.textStyle14!.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Text(
                                  cubit.allProducts?.data?[index].price
                                      .toString() ??
                                      '',
                                  style: Styles.textStyle14!
                                      .copyWith(color: Colors.green),
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Text(
                                  cubit.allProducts?.data?[index].genderType ??
                                      '',
                                  style: Styles.textStyle14!
                                      .copyWith(color: Colors.red),
                                ),
                                SizedBox(
                                  width: 18.w,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () => Navigator.of(context)
                                          .pushNamed(EditItem.routeName,arguments: cubit.allProducts!.data![index]),
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFFCFCFC),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0x3F000000),
                                                blurRadius: 6.60,
                                                offset: Offset(2, 4),
                                                spreadRadius: 0,
                                              )
                                            ],
                                            borderRadius:
                                            BorderRadius.circular(50.r)),
                                        child: Icon(
                                          Icons.edit,
                                          color: Color(0xFFF8B84E),
                                          size: 21,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => Dialog(
                                            child: DeleteItemAlert(
                                                'Want To delete this product ?',
                                                'You will delete this item if you click the delete button',
                                                cubit.allProducts!.data![index].id
                                                    .toString()),
                                          ),
                                        );
                                        print(cubit.allProducts!.data![index].id);
                                      },
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFFCFCFC),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0x3F000000),
                                                blurRadius: 6.60,
                                                offset: Offset(2, 4),
                                                spreadRadius: 0,
                                              )
                                            ],
                                            borderRadius:
                                            BorderRadius.circular(50.r)),
                                        child: Icon(
                                          Icons.delete_forever_outlined,
                                          color: CustomColors.red,
                                          size: 21,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  'not designable',
                                  style: Styles.textStyle12,
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Text(
                                    'Size : ${cubit.allProducts?.data?[index].productSize?[0].sizename ?? ''}',
                                    style: Styles.textStyle12),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Text(
                                    'Color : ${cubit.allProducts?.data?[index].productColor?[0].colorname ?? ''}',
                                    style: Styles.textStyle12),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: cubit.allProducts?.data?.length,
            ),
          );},
          fallback:(context)=> Center(child: CircularProgressIndicator()),
        );
      },
      listener: (context, state) {},
    );
  }
}