import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/iconBroken.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';

import '../../../authentication/login_screen/loginScreenView.dart';

class DashboardDrawer extends StatelessWidget {
  static const int drawerProductId=1;
  static const int drawerLogoId=2;
  static const int drawerDeliveryId=3;
  static const int drawerDesignProductId=4;
  Function onDrawerClick;

  DashboardDrawer({super.key, required this.onDrawerClick});

  @override
  Widget build(BuildContext context) {
    var mediaQuery=MediaQuery.of(context).size;
    return SizedBox(
      width: mediaQuery.width*0.7,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(40),
            height: mediaQuery.height*0.2,
            width: mediaQuery.width,
            color: CustomColors.blue,
            child: Center(child: Text('Admin dashboard',style: Styles.textStyle16.copyWith(fontSize: 20.sp,fontWeight: FontWeight.bold,color: Colors.white))),
          ),
          InkWell(
            onTap: (){
              onDrawerClick(DashboardDrawer.drawerProductId);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(IconBroken.Category,size: 40,color: CustomColors.blue,),
                  const SizedBox(width: 20,),
                  Text('Products',style: Styles.textStyle16,)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              onDrawerClick(DashboardDrawer.drawerLogoId);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(IconBroken.Heart,size: 40,color: CustomColors.blue,),
                  const SizedBox(width: 20,),
                  Text('Logos',style: Styles.textStyle16,)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              onDrawerClick(DashboardDrawer.drawerDeliveryId);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(IconBroken.Buy,size: 40,color: CustomColors.blue,),
                  const SizedBox(width: 20,),
                  Text('Delivery Methods',style: Styles.textStyle16)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              onDrawerClick(DashboardDrawer.drawerDesignProductId);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(IconBroken.Image,size: 40,color: CustomColors.blue,),
                  const SizedBox(width: 20,),
                  Text('Design Product',style: Styles.textStyle16)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, LoginScreenView.routeName);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(IconBroken.Logout,size: 40,color: CustomColors.blue,),
                  const SizedBox(width: 20,),
                  Text('Sign Out',style: Styles.textStyle16)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
