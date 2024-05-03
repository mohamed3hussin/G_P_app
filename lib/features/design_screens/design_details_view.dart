import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/shared_widget/custom_button.dart';
import 'package:g_p_app/features/design_screens/widgets/design_payment.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_cubit.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_state.dart';
import 'package:g_p_app/features/product_details/widgets/buttons_row.dart';
import 'package:g_p_app/features/product_details/widgets/color_line.dart';
import 'package:g_p_app/features/product_details/widgets/product_counter.dart';
import 'package:g_p_app/features/product_details/widgets/size_line.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import '../../core/assets_data/iconBroken.dart';
import '../../core/colors/colors.dart';
import '../../core/text_style/styles.dart';
import '../../data/model/response/AllProductResponse.dart';
import 'design_box_screen/design_box_screen.dart';

class DesignDetailsView extends StatefulWidget {
  static const String routeName = 'design_details';

  @override
  State<DesignDetailsView> createState() => _DesignDetailsViewState();
}

class _DesignDetailsViewState extends State<DesignDetailsView> {
  bool isPressed = false;
  bool isVisible = false;
  String selectedDesignImage = '';
  int selectedDesignIndex = 0;
  double selectedDesignCost = 0;
  void updateSelectedDesignCost(double cost) {
    setState(() {
      selectedDesignCost = cost;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      var cubit = BlocProvider.of<HomeCubit>(context);
      cubit.getLogos();
    });
    }


  @override
  Widget build(BuildContext context) {
    var args = ModalRoute
        .of(context)
        ?.settings
        .arguments as Data;
    return BlocConsumer<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 90.h,
            backgroundColor: Color(0xFFEFF1F8),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                IconBroken.Arrow___Left_2,
                color: CustomColors.blue,
              ),
            ),
            leadingWidth: 40.w,
            title: Text(
              'Design',
              style: Styles.textStyle24,
            ),
            titleSpacing: 4,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    IconBroken.Search,
                    color: Color(0xFF1B72C0),
                    size: 30,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    IconBroken.Buy,
                    color: Color(0xFF1B72C0),
                    size: 30,
                  ))
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 380.w,
                      height: 345.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/unsplash_WWesmHEgXDs.jpg'),
                        ),
                      ),
                      child: Center(
                        child: Container(
                          height: 160.h,
                          width: 115.w,
                          decoration: BoxDecoration(
                            border: DashedBorder.fromBorderSide(
                                dashLength: 5,
                                side:
                                BorderSide(color: Colors.black, width: 2)),
                          ),
                          child: isPressed
                                ? Image.network(selectedDesignImage)
                              : SizedBox(),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        args.name ?? '',
                        style: Styles.textStyle20!
                            .copyWith(color: CustomColors.blue, fontSize: 18),
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Text(
                        "${args.price.toString()} \$",
                        style: Styles.textStyle20!
                            .copyWith(color: CustomColors.green, fontSize: 18),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizeLine(),
                      SizedBox(
                        height: 15.h,
                      ),
                      ColorLine(),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'Pick a design you like',
                        style: Styles.textStyle20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.h),
                        padding: EdgeInsets.all(8.r),
                        width: 345.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: CustomColors.blue)),
                        child: Column(
                          children: [
                            GridView.count(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              crossAxisCount: 3,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 12,
                              childAspectRatio: 1 / 1.1,
                              children: cubit.logo != null // Check if listTestLogo is not null
                                  ? List.generate(
                                cubit.logo!.length,
                                    (index) => GestureDetector(
                                  onTap: () {
                                    isPressed = true;
                                    selectedDesignImage = cubit.logo![index].pictureUrl!;
                                    isVisible = true;
                                    selectedDesignIndex = index;
                                    setState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: selectedDesignIndex == index
                                          ? CustomColors.lightBlue
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(
                                        selectedDesignIndex == index ? 12 : 8,
                                      ),
                                      border: Border.all(
                                        color: selectedDesignIndex == index
                                            ? CustomColors.blue
                                            : Colors.grey,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: Image.network(
                                            cubit.logo![index].pictureUrl ?? '',
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                                          child: Text(
                                            "${cubit.logo![index].cost.toString()} \$",
                                            style: Styles.textStyle12!.copyWith(
                                              color: CustomColors.green,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                                  : [], // Empty list when cubit.logoResponse is null
                            ),
                            // GestureDetector(
                            //   onTap: () {},
                            //   child: Container(
                            //     margin: EdgeInsets.symmetric(vertical: 15.h),
                            //     width: 135,
                            //     height: 26,
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(12.r),
                            //       color: CustomColors.lightBlue,
                            //     ),
                            //     child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       children: [
                            //         Text(
                            //           'Load More',
                            //           style: Styles.textStyle14!
                            //               .copyWith(color: Colors.black),
                            //         ),
                            //         Icon(Icons.keyboard_arrow_down_rounded)
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: CustomColors.blue,
                              child: Icon(
                                Icons.edit,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                  context, DrawingRoomScreen.routeName);
                            },
                          ),
                          CustomButton(
                            backgroundColor: CustomColors.blue,
                            text: 'Upload Design',
                            func: () {},
                            style: Styles.textStyle16!
                                .copyWith(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                            width: 225.w,
                          )
                        ],
                      ),
                      Visibility(
                          visible: isVisible,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 25.h,
                              ),
                              ProductCounter(),
                              SizedBox(
                                height: 30.h,
                              ),
                              DesignPayment(cubit.logo![selectedDesignIndex],args),
                            ],
                          )),
                      ButtonsRow()
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
