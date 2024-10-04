import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/categories_screen/filtered_categories/tab_item.dart';

class TabContainer extends StatefulWidget {
  final ValueChanged<int> onIndexChanged;
  const TabContainer({super.key, required this.onIndexChanged});

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  int selectedIndex = 0;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
      final arguments = ModalRoute.of(context)?.settings.arguments as int;
      if (arguments ==1) {
        setState(() {
          selectedIndex = arguments;
        });
      }
  }
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          TabItem(
            name: 'Men',
            isSelected: selectedIndex == 0,
            onTap: () {
              setState(() {
                selectedIndex = 0;
              });
              widget.onIndexChanged(selectedIndex);

            },
          ),
          SizedBox(
            width: 10.w,
          ),
          TabItem(
            name: 'Women',
            isSelected:selectedIndex == 1,
            onTap: () {
              setState(() {
                selectedIndex = 1;
              });
              widget.onIndexChanged(selectedIndex);

            },
          ),
        ],
      ),
    ]);
  }
}
