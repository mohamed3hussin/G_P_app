import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/dashboard/dashBoardCubit/dash_board_state.dart';
import 'package:g_p_app/features/dashboard/widget/drawer.dart';
import 'package:g_p_app/features/dashboard/widget/logo_item.dart';
import 'package:g_p_app/features/dashboard/widget/product_item.dart';
import 'package:g_p_app/features/dashboard/widget/search_field.dart';

import '../../home_screen/home_layout/home_cubit/home_cubit.dart';
import '../../home_screen/home_layout/home_cubit/home_state.dart';
import '../dashBoardCubit/dash_board_cubit.dart';
import '../widget/delete_alert.dart';
import '../widget/delete_logo_alert.dart';
import '../widget/edit_item.dart';
import '../widget/edit_logo.dart';

class LogoDashboard extends StatefulWidget {
  static const String routeName = 'logo_dashboard_view';

  @override
  State<LogoDashboard> createState() => _LogoDashboardState();
}

class _LogoDashboardState extends State<LogoDashboard> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   WidgetsBinding.instance!.addPostFrameCallback((_) {
  //     var cubit = BlocProvider.of<HomeCubit>(context);
  //     cubit.getLogos();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashBoardCubit, DashBoardState>(
      builder: (context, state) {
        var cubit = DashBoardCubit.get(context);
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
                    Text('${index + 1}', style: Styles.textStyle14),
                    SizedBox(width: 8.w),
                    Container(
                      width: 42,
                      height: 42,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: NetworkImage(cubit.logo?[index].pictureUrl ?? ''),
                          fit: BoxFit.cover,
                        ),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    cubit.logo?[index].name ?? '',
                                    style: Styles.textStyle14.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 16.w),
                                  Text(
                                    cubit.logo?[index].cost.toString() ?? '',
                                    style: Styles.textStyle14.copyWith(color: Colors.green),
                                  ),
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
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(50.r),
                                    ),
                                    child: InkWell(
                                      onTap: ()
                                      {
                                        Navigator.push(context,
                                          MaterialPageRoute(
                                            builder:(context)=>EditLogo(
                                              cubit.logo![index].name,
                                              cubit.logo![index].cost.toString(),
                                              cubit.logo![index].quantity.toString(),
                                              cubit.logo![index].id,
                                              cubit.logo![index].pictureUrl
                                            ) ,
                                          ),);
                                      },
                                      child: Icon(Icons.edit, color: Color(0xFFF8B84E), size: 21),
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => Dialog(
                                          child: DeleteLogoAlert(
                                            'Want To delete this Logo ?',
                                            'You will delete this logo if you click the delete button',
                                              cubit.logo![index].id
                                                  .toString()
                                          ),
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
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(50.r),
                                      ),
                                      child: Icon(Icons.delete_forever_outlined, color: CustomColors.red, size: 22),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              Text(
                                cubit.logo?[index].dateofCreation.substring(0, 10) ?? '',
                                style: Styles.textStyle12,
                              ),
                              SizedBox(width: 15.w),
                              Text(
                                'Quantity : ${cubit.logo?[index].quantity ?? ''}',
                                style: Styles.textStyle12,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: cubit.logo?.length ?? 0,
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
