import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/my_order/past_order/past_orders_view.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/my_order/Track_order/track_order.dart';

import '../../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../../core/text_style/styles.dart';
import '../../profile_item.dart';


class MyOrdersView extends StatelessWidget {
static const String routeName='my_orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.h,
        backgroundColor: Color(0xFFEFF1F8),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(IconBroken.Arrow___Left),
        ),
        leadingWidth: 40.w,
        title: Center(child: Text('My Order',style: Styles.textStyle24,)),
        titleSpacing: 4,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 35.h,),
            GestureDetector(onTap: (){Navigator.pushNamed(context, TrackOrderView.routeName);},child: ProfileItem(icon: Icons.check_box, text: 'Current Order')),
            GestureDetector(onTap: (){Navigator.pushNamed(context, PastOrdersView.routeName);},child: ProfileItem(icon: Icons.file_copy, text: 'Past Orders')),
            ProfileItem(icon: Icons.shopping_bag, text: 'Return Orders'),
          ],
        ),
      ),
    );
  }
}
