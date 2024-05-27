import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/dashboard/widget/delivery_item.dart';
import 'package:g_p_app/features/dashboard/widget/drawer.dart';
import 'package:g_p_app/features/dashboard/widget/product_item.dart';
import 'package:g_p_app/features/dashboard/widget/search_field.dart';

import '../../home_screen/home_layout/home_cubit/home_cubit.dart';
import '../../home_screen/home_layout/home_cubit/home_state.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      var cubit = BlocProvider.of<HomeCubit>(context);
      cubit.getDeliveryMethods();
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Expanded(
          child: ListView.builder(
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
                                  Text(cubit.deliveryMethodsResponse?[index].shortName??'', style: Styles.textStyle14!.copyWith(
                                      color: Colors.black, fontWeight: FontWeight.bold),),
                                  SizedBox(width: 50.w,),
                                  Text(cubit.deliveryMethodsResponse?[index].cost.toString()??'',
                                    style: Styles.textStyle14!.copyWith(color: Colors.green),),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
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
                                        borderRadius: BorderRadius.circular(50.r)
                                    ),
                                    child: InkWell(
                                      onTap: ()=>Navigator.of(context).pushNamed(EditDelivery.routeName),
                                      child: Icon(
                                        Icons.edit, color: Color(0xFFF8B84E), size: 21,),
                                    ),
                                  ),
                                  SizedBox(width: 8.w,),
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context)
                                        =>
                                            Dialog(
                                              child: DeleteItemAlert(
                                                  'Want To delete this Delivery Method ?',
                                                  'You will delete this Method if you click the delete button'),
                                            ),
                                      );
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
                                          borderRadius: BorderRadius.circular(50.r)
                                      ),
                                      child: Icon(Icons.delete_forever_outlined,
                                        color: CustomColors.red, size: 22,),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h,),
                          Row(
                            children: [
                              SizedBox(width: 16.w,),
                              Text(cubit.deliveryMethodsResponse?[index].deliveryTime??'', style: Styles.textStyle12,),
                              SizedBox(width: 15.w,),
                              Text(cubit.deliveryMethodsResponse?[index].description??'', style: Styles.textStyle12),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: cubit.deliveryMethodsResponse?.length,
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
