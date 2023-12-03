import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/iconBroken.dart';
import 'package:g_p_app/core/shared_widget/default_search_text.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_cubit.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_state.dart';

import '../../../core/assets_data/assetsData.dart';

import 'home_screens/cart_screen/cart_screen.dart';
import 'home_screens/home_screen/home_screen.dart';
import 'home_screens/profile_screen/profile_screen.dart';

import 'home_screens/wish_list_screen/search_screen.dart';

class HomeLayout extends StatefulWidget {
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  var searchController = TextEditingController();
  int currentIndex= 0;
  List<Widget> homeScreens=
  [
    HomeScreen(),
    CartScreen(),
    WishListScreen(),
    ProfileScreen(),
  ];
  PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeScreen();
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context)=> HomeCubit(),
      child: BlocConsumer<HomeCubit,HomeState>(
        listener: (context,state){},
        builder: (context,state)
        {
          var homeCubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 90.h,
              backgroundColor: Color(0xFFEFF1F8),
              leading: Container(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w),
                  child: Image(
                      image: AssetImage(AssetsData.loginImage))),
              leadingWidth: 45.w,
              title: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10.sp),
                child: defaultSearchTextField(
                  type: TextInputType.name,
                  controller: searchController,
                  label: 'Search anything here',
                  prefix: IconBroken.Search,
                  enable: false,
                  validate: (value)
                  {
                    if(value!.isEmpty)
                    {

                      return 'Email most not empty';
                    }
                    else{
                      return null;}
                  },
                ),
              ),
              titleSpacing: 4,
              actions: [
                Container(child: IconButton(onPressed: (){}, icon: Icon(IconBroken.Notification,color: Color(0xFF1B72C0),size: 30,))),
                IconButton(onPressed: (){}, icon: Icon(IconBroken.Buy,color: Color(0xFF1B72C0),size: 30,))
              ],
            ),
            body:PageStorage(
              bucket: bucket,
              child:currentScreen,
            ),
            floatingActionButton:SizedBox(
              width: 60.w,
              height: 60.h,
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(35)),
                onPressed: () {
                  // Respond to button press
                },
                child: Icon(Icons.add),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(topEnd: Radius.circular(20),topStart: Radius.circular(20)),
              ),
              child: BottomAppBar(
                color: Colors.white,
                elevation: 1,
                shape: const CircularNotchedRectangle(),
                notchMargin:7,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Container(
                  height: 60.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MaterialButton(
                              minWidth: 40.w,
                              onPressed: ()
                              {
                                setState(() {
                                  currentScreen = HomeScreen();
                                  currentIndex = 0;
                                });
                              },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(IconBroken.Home,color: currentIndex==0? Color(0xFF74777F):Color(0xFF1B72C0),),
                                Text('Home',style: TextStyle(color: currentIndex==0? Color(0xFF74777F):Color(0xFF1B72C0),),)

                              ],
                            ),
                              ),
                          MaterialButton(
                            minWidth: 40.w,
                            onPressed: ()
                            {
                              setState(() {
                                currentScreen = CartScreen();
                                currentIndex = 1;
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(IconBroken.Buy,color: currentIndex==1? Color(0xFF74777F):Color(0xFF1B72C0),),
                                Text('Cart',style: TextStyle(color: currentIndex==1? Color(0xFF74777F):Color(0xFF1B72C0),),)

                              ],
                            ),
                          ),

                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MaterialButton(
                            minWidth: 40.w,
                            onPressed: ()
                            {
                              setState(() {
                                currentScreen = WishListScreen();
                                currentIndex = 2;
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(IconBroken.Document,color: currentIndex==2? Color(0xFF74777F):Color(0xFF1B72C0),),
                                Text('Wish List',style: TextStyle(color: currentIndex==2? Color(0xFF74777F):Color(0xFF1B72C0),),)

                              ],
                            ),
                          ),
                          MaterialButton(
                            minWidth: 40.w,
                            onPressed: ()
                            {
                              setState(() {
                                currentScreen = ProfileScreen();
                                currentIndex = 3;
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(IconBroken.Profile,color: currentIndex==3? Color(0xFF74777F):Color(0xFF1B72C0),),
                                Text('Profile',style: TextStyle(color: currentIndex==3? Color(0xFF74777F):Color(0xFF1B72C0),),)

                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),


              ),
            ),

          );
        },
      ),
    );
  }
}
