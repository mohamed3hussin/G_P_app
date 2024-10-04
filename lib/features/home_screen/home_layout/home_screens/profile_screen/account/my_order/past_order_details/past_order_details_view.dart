import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/data/model/response/AllOrdersResponse.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/my_order/past_order_details/order_item.dart';
import '../../../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../../../core/colors/colors.dart';
import '../../../../../../../../core/text_style/styles.dart';
import '../rate_product/rate_product_view.dart';

class PastOrderDetailsView extends StatelessWidget {
  static const String routeName = 'past_order_details';

  const PastOrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)?.settings.arguments as AllOrdersResponse;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.h,
        backgroundColor: const Color(0xFFEFF1F8),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(IconBroken.Arrow___Left_2,color: CustomColors.blue,),
        ),
        leadingWidth: 40.w,
        title: Text(
          'Past Orders',
          style: Styles.textStyle24,
        ),
        titleSpacing: 4,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 8.h,
          ),
          Expanded(child: ListView.builder(physics: const BouncingScrollPhysics(),itemBuilder: (context, index) {
            return OrderItem(args.items![index].productName ?? '',
                args.items![index].price.toString() ?? '',
                args.items![index].pictureUrl?.isNotEmpty == true
                // If not empty, access the first element's pictureUrl
                    ? args.items![index].pictureUrl![0].pictureUrl ?? ''
                // If empty, provide a default value or handle the case as needed
                    : null,(){Navigator.pushNamed(context, RateProductView.routeName,arguments: args.items![index]);});

          },itemCount: args.items!.length,),)


          // CustomTimeLine(
          //   isFirst: true,
          //   isLast: false,
          //   process: 'Order Placed',
          //   date: 'August 15,2023 ,10AM',
          //   icon: Icons.shopping_bag,
          // ),
          // CustomTimeLine(
          //   isFirst: false,
          //   isLast: false,
          //   process: 'Order Placed',
          //   date: 'August 15,2023 ,10AM',
          //   icon: Icons.table_rows_outlined,
          // ),
          // CustomTimeLine(
          //   isFirst: false,
          //   isLast: false,
          //   process: 'Order Placed',
          //   date: 'August 15,2023 ,10AM',
          //   icon: Icons.fire_truck,
          // ),
          // CustomTimeLine(
          //   isFirst: false,
          //   isLast: true,
          //   process: 'Order Placed',
          //   date: 'August 15,2023 ,10AM',
          //   icon: Icons.handshake_outlined,
          // ),
        ],
      ),
    );
  }
}