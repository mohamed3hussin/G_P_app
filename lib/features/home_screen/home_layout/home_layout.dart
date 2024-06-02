import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/iconBroken.dart';
import 'package:g_p_app/core/cach_helper/cach_helper.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/shared_widget/default_search_text.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/dashboard/dashboard_home.dart';
import 'package:g_p_app/features/design_screens/design_explain_screen1.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_cubit.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_state.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/home_screen/home_screen_widget/product_view_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/assets_data/assetsData.dart';
import 'home_screens/cart_screen/cart_screen.dart';
import 'home_screens/home_screen/home_screen.dart';
import 'home_screens/profile_screen/profile_screen_view.dart';
import 'home_screens/search_screen/search_view.dart';
import 'home_screens/wish_list_screen/wish_list_view.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = 'home_layout';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  var searchController = TextEditingController();
  int currentIndex = 0;
  List<Widget> homeScreens = [
    HomeScreen(),
    CartScreen(),
    WishListScreen(),
    ProfileScreenView(),
  ];
  List<String>? roles = CacheHelper.sharedPreferences.getStringList('role');
  PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeScreen();
  late String title;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            toolbarHeight: 90.h,
            backgroundColor: Color(0xFFEFF1F8),
            leading: Container(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w),
                child: Image(image: AssetImage(AssetsData.loginImage))),
            leadingWidth: 45.w,
            title: currentIndex == 0
                ? Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10.sp),
                    child: GestureDetector(
                      onTap: () =>
                          showSearch(context: context, delegate: SearchView()),
                      child: defaultSearchTextField(
                        type: TextInputType.name,
                        controller: searchController,
                        label: 'Search anything here',
                        prefix: IconBroken.Search,
                        enable: false,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'search field must not empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  )
                : Text(
                    title,
                    style: Styles.textStyle24.copyWith(
                        color: CustomColors.darkBlue,
                        fontWeight: FontWeight.w700),
                  ),
            titleSpacing: 4,
            actions: [
              currentIndex == 0
                  ? roles?.length == 1
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: IconButton(
                              onPressed: () {},
                              icon: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Icon(
                                    IconBroken.Buy,
                                    color: Color(0xFF1B72C0),
                                    size: 30,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 8,
                                    child: Text(
                                      '${cubit.listCartItems?.length == null ? 0 : cubit.listCartItems?.length}',
                                      style: TextStyle(fontSize: 10.sp),
                                    ),
                                  ),
                                ],
                              )),
                        )
                      : Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, DashboardHomeScreen.routeName);
                                },
                                icon: Icon(
                                  IconBroken.Profile,
                                  size: 30,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Icon(
                                      IconBroken.Buy,
                                      color: Color(0xFF1B72C0),
                                      size: 30,
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Colors.red,
                                      radius: 8,
                                      child: Text(
                                        '${cubit.listCartItems?.length == null ? 0 : cubit.listCartItems?.length}',
                                        style: TextStyle(fontSize: 10.sp),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        )
                  : Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              IconBroken.Search,
                              color: Color(0xFF1B72C0),
                              size: 30,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Icon(
                                  IconBroken.Buy,
                                  color: Color(0xFF1B72C0),
                                  size: 30,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 8,
                                  child: Text(
                                    '${cubit.listCartItems?.length == null ? 0 : cubit.listCartItems?.length}',
                                    style: TextStyle(fontSize: 10.sp),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
            ],
          ),
          body: PageStorage(
            bucket: bucket,
            child: currentScreen,
          ),
          floatingActionButton: Container(
            width: 65.w,
            height: 65.h,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, DesignExplainScreenOne.routeName);
              },
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment(0.69, -0.75),
                    end: Alignment(-0.69, 0.72),
                    colors: [Color(0xFFD3E4FF), Color(0xFF1B72C0)],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.r),
                  child: Image.asset(
                    'assets/images/floating_action_button_img.png',
                  ),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                  topEnd: Radius.circular(20), topStart: Radius.circular(20)),
            ),
            child: BottomAppBar(
              color: Colors.white,
              elevation: 1,
              shape: const CircularNotchedRectangle(),
              notchMargin: 7,
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
                          onPressed: () {
                            setState(() {
                              currentScreen = HomeScreen();
                              currentIndex = 0;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                IconBroken.Home,
                                color: currentIndex == 0
                                    ? Color(0xFF74777F)
                                    : Color(0xFF1B72C0),
                              ),
                              Text(
                                'Home',
                                style: TextStyle(
                                  color: currentIndex == 0
                                      ? Color(0xFF74777F)
                                      : Color(0xFF1B72C0),
                                ),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40.w,
                          onPressed: () {
                            setState(() {
                              currentScreen = CartScreen();
                              currentIndex = 1;
                              title = 'Cart';
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                IconBroken.Buy,
                                color: currentIndex == 1
                                    ? Color(0xFF74777F)
                                    : Color(0xFF1B72C0),
                              ),
                              Text(
                                'Cart',
                                style: TextStyle(
                                  color: currentIndex == 1
                                      ? Color(0xFF74777F)
                                      : Color(0xFF1B72C0),
                                ),
                              )
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
                          onPressed: () {
                            setState(() {
                              currentScreen = WishListScreen();
                              currentIndex = 2;
                              title = 'WishList';
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                IconBroken.Heart,
                                color: currentIndex == 2
                                    ? Color(0xFF74777F)
                                    : Color(0xFF1B72C0),
                              ),
                              Text(
                                'WishList',
                                style: TextStyle(
                                  color: currentIndex == 2
                                      ? Color(0xFF74777F)
                                      : Color(0xFF1B72C0),
                                ),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40.w,
                          onPressed: () {
                            setState(() {
                              currentScreen = ProfileScreenView();
                              currentIndex = 3;
                              title = 'Profile';
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                IconBroken.Profile,
                                color: currentIndex == 3
                                    ? Color(0xFF74777F)
                                    : Color(0xFF1B72C0),
                              ),
                              Text(
                                'Profile',
                                style: TextStyle(
                                  color: currentIndex == 3
                                      ? Color(0xFF74777F)
                                      : Color(0xFF1B72C0),
                                ),
                              )
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
    );
  }
}
