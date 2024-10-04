import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/assets_data/assetsData.dart';
import '../../../../core/assets_data/iconBroken.dart';
import '../../../../core/cache_helper/cache_helper.dart';
import '../../../../core/colors/colors.dart';
import '../../../../core/shared_widget/default_search_text.dart';
import '../../../../core/text_style/styles.dart';
import '../../../dashboard/ui/dashboard_home.dart';
import '../home_cubit/home_cubit.dart';
import '../home_screens/search_screen/search_view.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentIndex;
  final TextEditingController searchController;
  final String title;

  const HomeAppBar({
    Key? key,
    required this.currentIndex,
    required this.searchController,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    List<String>? roles = CacheHelper.sharedPreferences.getStringList('role');

    return AppBar(
      toolbarHeight: 90.h,
      backgroundColor: const Color(0xFFEFF1F8),
      leading: Container(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w),
          child: const Image(image: AssetImage(AssetsData.loginImage))),
      leadingWidth: 45.w,
      title: currentIndex == 0
          ? Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10.sp),
        child: GestureDetector(
          onTap: () => showSearch(context: context, delegate: SearchView()),
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
            color: CustomColors.darkBlue, fontWeight: FontWeight.w700),
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
                  const Icon(
                    IconBroken.Buy,
                    color: Color(0xFF1B72C0),
                    size: 30,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 8,
                    child: Text(
                      '${cubit.listCartItems?.length ?? 0}',
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
                icon: const Icon(
                  IconBroken.Profile,
                  size: 30,
                )),
            IconButton(
                onPressed: () {},
                icon: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    const Icon(
                      IconBroken.Buy,
                      color: Color(0xFF1B72C0),
                      size: 30,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 8,
                      child: Text(
                        '${cubit.listCartItems?.length ?? 0}',
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
                icon: const Icon(
                  IconBroken.Search,
                  color: Color(0xFF1B72C0),
                  size: 30,
                )),
            IconButton(
                onPressed: () {},
                icon: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    const Icon(
                      IconBroken.Buy,
                      color: Color(0xFF1B72C0),
                      size: 30,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 8,
                      child: Text(
                        '${cubit.listCartItems?.length ?? 0}',
                        style: TextStyle(fontSize: 10.sp),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(90.h);
}
