import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/assets_data/iconBroken.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabTapped;

  const HomeBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTabTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      elevation: 1,
      shape: const CircularNotchedRectangle(),
      notchMargin: 7,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: SizedBox(
        height: 60.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBottomNavigationItem(IconBroken.Home, 'Home', 0),
                _buildBottomNavigationItem(IconBroken.Buy, 'Cart', 1),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBottomNavigationItem(IconBroken.Heart, 'WishList', 2),
                _buildBottomNavigationItem(IconBroken.Profile, 'Profile', 3),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationItem(IconData icon, String label, int index) {
    return MaterialButton(
      minWidth: 40.w,
      onPressed: () => onTabTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: currentIndex == index ? const Color(0xFF74777F) : const Color(0xFF1B72C0),
          ),
          Text(
            label,
            style: TextStyle(
              color: currentIndex == index ? const Color(0xFF74777F) : const Color(0xFF1B72C0),
            ),
          )
        ],
      ),
    );
  }
}
