import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/dashboard/products/tab_item_admin_dashboard.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/categories_screen/filtered_categories/tab_item.dart';

class TabContainerDashBoard extends StatefulWidget {
  final ValueChanged<int> onIndexChanged;
  TabContainerDashBoard({required this.onIndexChanged});

  @override
  State<TabContainerDashBoard> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainerDashBoard> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.h),
        child: Row(
          children: [
            Expanded(
              child: TabItemAdminDashboard(
                name: 'not Designable',
                isSelected: selectedIndex == 0,
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                  widget.onIndexChanged(selectedIndex);

                },
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: TabItemAdminDashboard(
                name: 'Designable',
                isSelected:selectedIndex == 1,
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                  widget.onIndexChanged(selectedIndex);

                },
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
