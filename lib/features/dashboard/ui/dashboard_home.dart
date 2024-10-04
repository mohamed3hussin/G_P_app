import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/dashboard/ui/products/product_dashbord.dart';
import 'package:g_p_app/features/dashboard/ui/logos/add_logo_screen/add_logo_screen.dart';
import 'package:g_p_app/features/dashboard/ui/products/add_product_screen/add_product.dart';
import 'package:g_p_app/features/dashboard/ui/widget/drawer.dart';

import '../logic/dashBoardCubit/dashboard_cubit.dart';
import '../logic/dashBoardCubit/dashboard_state.dart';
import 'dash_board_design_product/dashboard_design_product.dart';
import 'delivery/delivery_dashbord.dart';
import 'logos/Logo_dashbord.dart';

class DashboardHomeScreen extends StatefulWidget {
  static const String routeName = 'dashboard_view';

  const DashboardHomeScreen({super.key});

  @override
  State<DashboardHomeScreen> createState() => _DashboardHomeScreenState();
}

class _DashboardHomeScreenState extends State<DashboardHomeScreen> {
  int selectedDrawerItem = DashboardDrawer.drawerProductId;

  void onDrawerClick(int newSelectedDrawerItem) {
    selectedDrawerItem = newSelectedDrawerItem;
    setState(() {});
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit,DashboardState>
    (
    listener: (context,state){},
    builder: (context,state){
      return Scaffold(
      endDrawer: Drawer(
        child: DashboardDrawer(
          onDrawerClick: onDrawerClick,
        ),
      ),
      appBar: AppBar(
        backgroundColor: CustomColors.blue,
        title: Text(
          selectedDrawerItem ==DashboardDrawer.drawerProductId
              ? 'Products'
              : selectedDrawerItem == DashboardDrawer.drawerLogoId
              ? 'Logos'
              :selectedDrawerItem == DashboardDrawer.drawerDeliveryId
              ? 'Delivery Methods'
              :'Design Product',
          style: Styles.textStyle24.copyWith(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white, size: 35),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors.white,
              size: 35), onPressed: () { Navigator.pop(context); },
        ),
      ),
      floatingActionButton: SpeedDial(
        overlayColor: CustomColors.darkGrey,
        overlayOpacity: 0.7,
        backgroundColor: CustomColors.blue,
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: const IconThemeData(color: Colors.white,size: 30),
        closeManually: false,
        buttonSize: const Size(60,60),
        childrenButtonSize: const Size(65,65),
        children: [
          SpeedDialChild(
            onTap: ()=>Navigator.of(context).pushNamed(AddProduct.routeName),
            shape: const CircleBorder(),
            child: const Icon(Icons.add),
            labelWidget: Text('Add Product',style:Styles.textStyle16.copyWith(color: Colors.black,fontWeight: FontWeight.w400)),
            labelBackgroundColor: Colors.transparent,
          ),
          SpeedDialChild(
            onTap: ()=>Navigator.of(context).pushNamed(AddLogoScreen.routeName),
            shape: const CircleBorder(),
            child: const Icon(Icons.add),
            labelWidget: Text('Add Logo',style:Styles.textStyle16.copyWith(color: Colors.black,fontWeight: FontWeight.w400)),
            labelBackgroundColor: Colors.transparent,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: Column(
          children: [
            //SearchField(),
            SizedBox(height: 20.h,),
            selectedDrawerItem == DashboardDrawer.drawerProductId
                ? const ProductDashboard()
                : selectedDrawerItem == DashboardDrawer.drawerLogoId
                ? const LogoDashboard()
                :selectedDrawerItem == DashboardDrawer.drawerDeliveryId
                ? const DeliverMethodDashboard()
                : const DesignProductDashboard(),
          ],
        ),
      ),
    );},
        );
  }
}
