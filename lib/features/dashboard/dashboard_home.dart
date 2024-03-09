import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/dashboard/delivery/delivery_dashbord.dart';
import 'package:g_p_app/features/dashboard/logos/Logo_dashbord.dart';
import 'package:g_p_app/features/dashboard/products/product_dashbord.dart';
import 'package:g_p_app/features/dashboard/widget/drawer.dart';
import 'package:g_p_app/features/dashboard/widget/search_field.dart';
import 'all_categories/all_category_dashbord.dart';

class DashboardHomeScreen extends StatefulWidget {
  static const String routeName = 'dashboard_view';

  @override
  State<DashboardHomeScreen> createState() => _DashboardHomeScreenState();
}

class _DashboardHomeScreenState extends State<DashboardHomeScreen> {
  int selectedDrawerItem = DashboardDrawer.drawerAllCategoriesId;

  void onDrawerClick(int newSelectedDrawerItem) {
    selectedDrawerItem = newSelectedDrawerItem;
    setState(() {});
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: DashboardDrawer(
          onDrawerClick: onDrawerClick,
        ),
      ),
      appBar: AppBar(
        backgroundColor: CustomColors.blue,
        title: Text(
          selectedDrawerItem == DashboardDrawer.drawerAllCategoriesId
              ? 'All Categories'
              : selectedDrawerItem == DashboardDrawer.drawerProductId
                  ? 'Products'
                  : selectedDrawerItem == DashboardDrawer.drawerLogoId
                      ? 'Logos'
                      : 'Delivery Methods',
          style: Styles.textStyle24!.copyWith(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white, size: 35),
        leading: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 35,
        ),
      ),
      floatingActionButton: SpeedDial(
        overlayColor: CustomColors.darkGrey,
        overlayOpacity: 0.7,
        backgroundColor: CustomColors.blue,
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(color: Colors.white,size: 30),
        closeManually: false,
        buttonSize: Size(60,60),
        childrenButtonSize: Size(65,65),
        children: [
          SpeedDialChild(
            shape: CircleBorder(),
            child: Icon(Icons.add),
            labelWidget: Text('Add Product',style:Styles.textStyle16!.copyWith(color: Colors.black,fontWeight: FontWeight.w400)),
            labelBackgroundColor: Colors.transparent,
          ),
          SpeedDialChild(
              shape: CircleBorder(),
              child: Icon(Icons.add),
              labelWidget: Text('Add Logo',style:Styles.textStyle16!.copyWith(color: Colors.black,fontWeight: FontWeight.w400)),
              labelBackgroundColor: Colors.transparent,
         ),
          SpeedDialChild(
              shape: CircleBorder(),
              child: Icon(Icons.add),
            labelWidget: Text('Add Delivery Method',style:Styles.textStyle16!.copyWith(color: Colors.black,fontWeight: FontWeight.w400)),
            labelBackgroundColor: Colors.transparent,
          ),
        ],
      ),
      body: Column(
        children: [
          SearchField(),
          selectedDrawerItem == DashboardDrawer.drawerAllCategoriesId
              ? AllCategoryDashboard()
              : selectedDrawerItem == DashboardDrawer.drawerProductId
                  ? ProductDashboard()
                  : selectedDrawerItem == DashboardDrawer.drawerLogoId
                      ? LogoDashboard()
                      : DeliverMethodDashboard()
        ],
      ),
    );
  }
}
