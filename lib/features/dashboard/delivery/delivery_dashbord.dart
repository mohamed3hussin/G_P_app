import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/dashboard/dashBoardCubit/dash_board_cubit.dart';
import 'package:g_p_app/features/dashboard/dashBoardCubit/dash_board_state.dart';
import 'package:g_p_app/features/dashboard/widget/delivery_item.dart';
import 'package:g_p_app/features/dashboard/widget/drawer.dart';
import 'package:g_p_app/features/dashboard/widget/product_item.dart';
import 'package:g_p_app/features/dashboard/widget/search_field.dart';
import '../widget/delete_alert.dart';
import '../widget/edit_delivery.dart';
import '../widget/edit_logo.dart';

class DeliverMethodDashboard extends StatefulWidget {
  static const String routeName='product_dashboard_view';

  @override
  State<DeliverMethodDashboard> createState() => _DeliverMethodDashboardState();
}

class _DeliverMethodDashboardState extends State<DeliverMethodDashboard> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   WidgetsBinding.instance!.addPostFrameCallback((_) {
  //     var cubit = BlocProvider.of<DashBoardCubit>(context);
  //     cubit.getDeliveryMethods();
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit, DashBoardState>(
      builder: (context, state) {
        var cubit = DashBoardCubit.get(context);

        return ConditionalBuilder(
          condition:cubit.deliveryMethodsResponseList!.isNotEmpty,
          builder: (context){return Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  width: 350,
                  height: 80,
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                  margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: CustomColors.lightGrey,
                  ),
                  child: Row(
                    children: [
                      Text('${index+1}', style: Styles.textStyle14,),
                      SizedBox(width: 8.w,),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 16.w,),
                                    Text(cubit.deliveryMethodsResponseList?[index].shortName??'', style: Styles.textStyle14!.copyWith(
                                        color: Colors.black, fontWeight: FontWeight.bold),),
                                    SizedBox(width: 50.w,),
                                    Text(cubit.deliveryMethodsResponseList?[index].cost.toString()??'',
                                      style: Styles.textStyle14!.copyWith(color: Colors.green),),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h,),
                            Row(
                              children: [
                                SizedBox(width: 16.w,),
                                Text(cubit.deliveryMethodsResponseList?[index].deliveryTime??'', style: Styles.textStyle12,),
                                SizedBox(width: 15.w,),
                                Text(cubit.deliveryMethodsResponseList?[index].description??'', style: Styles.textStyle12),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: cubit.deliveryMethodsResponseList!.length,
            ),
          );},
          fallback:(context)=> Center(child: CircularProgressIndicator()),
        );
      },
      listener: (context, state) {},
    );
  }
}
