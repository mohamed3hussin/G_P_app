import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/profile_item.dart';
import '../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../core/colors/colors.dart';
import '../../../../../../core/text_style/styles.dart';

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
          SizedBox(height: 25.h,),
          ProfileItem(icon: Icons.payment, text: 'Debit/Credit Card',arrowIcon: false,),

          SizedBox(height: 20.h,),
        ],
      ),
    );
  }
}
