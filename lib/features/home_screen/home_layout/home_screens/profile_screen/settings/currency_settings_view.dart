import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/settings/widgets/profile_item_with_checkicon.dart';
import '../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../core/colors/colors.dart';
import '../../../../../../core/text_style/styles.dart';

class CurrencySettingsView extends StatefulWidget {
  static const String routeName = 'currency_view';

  @override
  State<CurrencySettingsView> createState() => _CurrencySettingsViewState();
}

class _CurrencySettingsViewState extends State<CurrencySettingsView> {
  List<String> currency = ['USD', 'EUR','EGY'];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
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
        title: Center(
            child: Text(
              'Language',
              style: Styles.textStyle24,
            )),
        titleSpacing: 4,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    currentIndex=index;
                    setState(() {
                    });
                  },
                  child: ProfileItemWithCheckIcon(text: currency[index],isSelected: currentIndex==index,)),itemCount: currency.length,
            ),
          )
        ],
      ),
    );
  }
}
