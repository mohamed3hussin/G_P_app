import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:g_p_app/core/assets_data/iconBroken.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_state.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_layout.dart';
import '../../../../../core/shared_widget/custom_button.dart';
import '../../home_cubit/home_cubit.dart';
import 'cart-widget/check_out_addrees.dart';
import 'cart-widget/togglebutton_widget_list.dart';

class CheckOutScreenBuyNow extends StatefulWidget {
  static const String routeName = 'check_out_buy_now';

  @override
  State<CheckOutScreenBuyNow> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreenBuyNow> {
  String groupValue = '';
  List<bool> isSelected = [true,false, false,false];
  int deliveryMethodNumber=1;

  @override
  void initState() {
    // TODO: implement initState
    HomeCubit.get(context).getCurrentUserAddress();
  }

  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)?.settings.arguments as Map<String,dynamic>;
    return BlocConsumer<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context)..createPaymentIntent(orderId: 'temp_basket');
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
                    height: 10.h,
                  ),
                  Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        'Delivery Methods',
                        style: Styles.textStyle16.copyWith(
                            color: CustomColors.textColor,
                            fontWeight: FontWeight.w600),
                      )),
                  SizedBox(
                    height: 7.h,
                  ),
                  ToggleButtons(borderRadius: BorderRadius.circular(12.r),borderWidth: 1,borderColor: Colors.black,
                    selectedBorderColor: CustomColors.blue,
                    isSelected: isSelected,
                    onPressed: (index) {
                      setState(() {
                        for (int i = 0; i < isSelected.length; i++) {
                          deliveryMethodNumber=index+1;
                          isSelected[i] = i == index;
                        }
                        cubit.updateDeliveryMethodId(deliveryMethodNumber);
                        print(deliveryMethodNumber);
                      });
                    },
                    children: toggleButtonWidgetList(),
                  ),
                  SizedBox(height: 10.h,),
                  Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        'Selected Products:',
                        style: Styles.textStyle16.copyWith(
                            color: CustomColors.textColor,
                            fontWeight: FontWeight.w600),
                      )),
              Material(
                borderRadius: BorderRadius.circular(12),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 1,
                child: Container(
                  child: Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 6),
                    child: Row(
                      children: [
                        SizedBox(width: 10.w,),
                        Image(
                          image: NetworkImage(args['pictureUrl']),
                          width: 80.w,
                          height: 80.h,
                          fit:BoxFit.cover,
                        ),
                        SizedBox(width: 10.w,),
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              args['productName']??'',
                              style: Styles.textStyle14.copyWith(color: CustomColors.textColor,fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 5.h,),
                            Text(
                              'Size : ${args['size']}',
                              style: Styles.textStyle14,
                            ),
                            Text(
                                '\$ ${args['price']}',
                                style: Styles.textStyle16.copyWith(color: CustomColors.green,fontWeight: FontWeight.w600)
                            ),
                          ],
                        )),
                        Column(
                          children: [
                            Text('${args['quantity']} item',style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600,color: CustomColors.darkGrey)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),),
                  SizedBox(
                    height: 240.h,
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
        HomeCubit.get(context).createCheckOut('temp_basket');
        Navigator.pushReplacementNamed(context, HomeLayout.routeName);

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
