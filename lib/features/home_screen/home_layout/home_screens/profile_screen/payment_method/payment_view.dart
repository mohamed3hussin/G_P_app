import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/profile_item.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import '../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../core/colors/colors.dart';
import '../../../../../../core/text_style/styles.dart';
import 'add_creidt_screen.dart';

class PaymentView extends StatelessWidget {
  static const String routeName = 'payment_View';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.h,
        backgroundColor: Color(0xFFEFF1F8),
        leading: IconButton(
          onPressed: (){Navigator.pop(context);},icon: Icon(IconBroken.Arrow___Left_2,color: CustomColors.blue,),),
        title: Text('Payment Methods'),
        titleTextStyle: Styles.textStyle24.copyWith(color: CustomColors.darkBlue,fontWeight: FontWeight.w700),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:EdgeInsets.symmetric(horizontal: 16.w,vertical: 25.h),
            child: Text(
              'Choose Payment Methods',
              style: Styles.textStyle16.copyWith(
                  color: CustomColors.darkBlue,
                  fontWeight: FontWeight.w600),),
          ),
          ProfileItem(icon: Icons.payment, text: 'Debit/Credit Card',arrowIcon: false,),
          ProfileItem(icon: Icons.paypal, text: 'Paypal',arrowIcon: false,),
          ProfileItem(icon: Icons.apple, text: 'Apple Pay',arrowIcon: false,),
          SizedBox(height: 20.h,),
          Container(
            child: InkWell(
              onTap: (){
                Navigator.of(context).pushNamed(MySample.routeName);
              },
              child: Container(
                height: 60.h,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                    border: DashedBorder.fromBorderSide(
                        dashLength: 5, side: BorderSide(color: Color(0xFF74777F), width: 2)),
                    borderRadius: BorderRadius.all(Radius.circular(8))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.add,color: Color(0xFF74777F)),
                    SizedBox(width: 10.w,),
                    Text('Add Another Option',style: Styles.textStyle16.copyWith(color: Color(0xFF74777F)),),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
