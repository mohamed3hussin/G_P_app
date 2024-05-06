import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_cubit.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_state.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/cart_screen/no_item.dart';
import 'cart-widget/cart_list_view.dart';
import 'cart-widget/check_out_bottun.dart';

class CartScreen extends StatefulWidget {
  static const String routeName='cart_screen';

   const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
@override
  void initState() {
    // TODO: implement initState
    var cubit=BlocProvider.of<HomeCubit>(context);
    cubit.getCart();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeState>(builder: (context, state) {
      var cubit=BlocProvider.of<HomeCubit>(context);
      return ConditionalBuilder(
        condition: cubit.listCartItems!=null,
        builder:(context) => Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Column(
            children: [
              CartListView(cubit.listCartItems!),
              CheckoutBottun(context),
            ],
          ),
        ),
        fallback: (context) => NoItemView(),
      );
    }, listener: (context, state) {

    },);
  }

}
