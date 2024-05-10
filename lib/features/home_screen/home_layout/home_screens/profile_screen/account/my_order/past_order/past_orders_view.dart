import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_cubit.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_state.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/my_order/past_order/past_order_item.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/my_order/past_order_details/past_order_details_view.dart';
import '../../../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../../../core/colors/colors.dart';
import '../../../../../../../../core/text_style/styles.dart';

class PastOrdersView extends StatelessWidget {
  static const String routeName = 'past_orders';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context)..getUserOrders();
        return Scaffold(
          backgroundColor: Colors.white,
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
              'Past Orders',
              style: Styles.textStyle24,
            ),
            titleSpacing: 4,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 16.h,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, PastOrderDetailsView.routeName,arguments: cubit.allOrdersResponse![index]);
                    },
                    child: PastOrderItem(
                        orderId: '# ${cubit.allOrdersResponse![index].id}',
                        orderStatus: '${cubit.allOrdersResponse![index]?.status}',
                        arrivalTime:
                            '${cubit.allOrdersResponse![index]?.orderDate}',
                        numOfItems:
                            '${cubit.allOrdersResponse![index]?.items?.length} Items',
                        address:
                            '${cubit.allOrdersResponse![index].shippingAddress?.country}, ${cubit.allOrdersResponse![index].shippingAddress?.city}, ${cubit.allOrdersResponse![index].shippingAddress?.street}',
                        isPacked: true,
                        isArrived: false,
                        isDelivered: false),
                  ),
                  itemCount: cubit.allOrdersResponse?.length,
                ),
              )
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
