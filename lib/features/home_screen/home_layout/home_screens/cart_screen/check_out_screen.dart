import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:g_p_app/core/assets_data/iconBroken.dart';
import 'package:g_p_app/core/cach_helper/cach_helper.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_state.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_layout.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/home_screen/home_screen_widget/product_view_widget.dart';
import '../../../../../core/shared_widget/custom_button.dart';
import '../../home_cubit/home_cubit.dart';
import 'cart-widget/check_out_addrees.dart';
import 'cart-widget/check_out_confirm_payment.dart';
import 'cart-widget/check_out_pay_cash.dart';
import 'cart-widget/check_out_pay_credit.dart';
import 'cart-widget/check_out_selected_product.dart';

class CheckOutScreen extends StatefulWidget {
  static const String routeName = 'check_out_screen';

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  String groupValue = '';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context)..getCurrentUserAddress()
          ..getCartFromPrefs()
          ..createPaymentIntent();
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 90.h,
            backgroundColor: Color(0xFFEFF1F8),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                IconBroken.Arrow___Left_2,
                color: CustomColors.blue,
              ),
            ),
            title: Text('Checkout'),
            titleTextStyle: Styles.textStyle24.copyWith(
                color: CustomColors.darkBlue, fontWeight: FontWeight.w700),
            centerTitle: true,
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
          body: Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: 20.w, vertical: 10.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        'Delivery Address',
                        style: Styles.textStyle16.copyWith(
                            color: CustomColors.textColor,
                            fontWeight: FontWeight.w600),
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  CheckoutAddress(),
                  SizedBox(
                    height: 15.h,
                  ),
                  Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        'Selected Products:',
                        style: Styles.textStyle16.copyWith(
                            color: CustomColors.textColor,
                            fontWeight: FontWeight.w600),
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  CheckoutSelectedProduct(cubit.listCartItems!),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomButton(
                      width: double.infinity,
                      height: 56.h,
                      radius: 12,
                      backgroundColor: CustomColors.blue,
                      text: 'Confirm Payment',
                      func: () async {
                        await initPaymentSheet();
                      },
                      style: Styles.textStyle16.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  Future<void> initPaymentSheet() async {
    try {
      var data = HomeCubit.get(context).paymentIntent;
      // 2. initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              // Set to true for custom flow
              customFlow: false,
              // Main params
              merchantDisplayName: 'Flutter Stripe Store Demo',
              paymentIntentClientSecret: data?.clilentSecret,
              // Customer keys
              customerId: data?.paymentIntentId,
              // Extra options
              style: ThemeMode.light,
              appearance: PaymentSheetAppearance(
                  colors: PaymentSheetAppearanceColors(
                primary: CustomColors.blue,
                componentBorder: CustomColors.blue,
              ))));
      await Stripe.instance.presentPaymentSheet();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 1),
          content: Center(
              child: Text(
            "Paid successfully!",
            style: Styles.textStyle16,
          )),
          backgroundColor: CustomColors.green));
      Future.delayed(Duration(seconds: 2), () {
        HomeCubit.get(context).createCheckOut('basket1');
        Navigator.pushReplacementNamed(context, HomeLayout.routeName);
        HomeCubit.get(context).listCartItems = [];
        HomeCubit.get(context).deleteCartFromPref();

      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 1),
          content: Center(
              child: Text(
            "Payment is Canceled!",
            style: Styles.textStyle16,
          )),
          backgroundColor: CustomColors.red,
        ),
      );
      rethrow;
    }
  }
}
