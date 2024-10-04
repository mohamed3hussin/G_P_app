import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_p_app/features/home_screen/home_layout/widgets/home_layout_appbar.dart';
import 'package:g_p_app/features/home_screen/home_layout/widgets/home_layout_floating_action_button.dart';
import 'package:g_p_app/features/home_screen/home_layout/widgets/home_layout_nav_bar.dart';

import 'home_cubit/home_cubit.dart';
import 'home_cubit/home_state.dart';
import 'home_screens/cart_screen/cart_screen.dart';
import 'home_screens/home_screen/home_screen.dart';
import 'home_screens/profile_screen/profile_screen_view.dart';
import 'home_screens/wish_list_screen/wish_list_view.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = 'home_layout';

  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  var searchController = TextEditingController();
  int currentIndex = 0;
  List<Widget> homeScreens = [
    HomeScreen(),
    const CartScreen(),
    const WishListScreen(),
    const ProfileScreenView(),
  ];
  PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeScreen();
  late String title;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
      currentScreen = homeScreens[index];
      title = _getTitleForIndex(index);
    });
  }

  String _getTitleForIndex(int index) {
    switch (index) {
      case 1:
        return 'Cart';
      case 2:
        return 'WishList';
      case 3:
        return 'Profile';
      default:
        return 'Home';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          appBar: HomeAppBar(
            currentIndex: currentIndex,
            searchController: searchController,
            title: title,
          ),
          body: PageStorage(
            bucket: bucket,
            child: currentScreen,
          ),
          floatingActionButton: const CustomFloatingActionButton(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: HomeBottomNavigationBar(
            currentIndex: currentIndex,
            onTabTapped: onTabTapped,
          ),
        );
      },
    );
  }
}
