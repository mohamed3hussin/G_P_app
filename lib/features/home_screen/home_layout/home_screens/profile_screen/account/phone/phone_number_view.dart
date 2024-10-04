import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/core/shared_widget/custom_button.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/phone/phone_verification.dart';
import '../../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../../core/text_style/styles.dart';

class PhoneNumberView extends StatefulWidget {
  static const String routeName = 'phone_view';
  List<String> list = ['+20', '+968', '+966', '+971'];

  PhoneNumberView({super.key});

  @override
  State<PhoneNumberView> createState() => _PhoneNumberViewState();
}

class _PhoneNumberViewState extends State<PhoneNumberView> {
  String dropdownValue = '+20';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.h,
        backgroundColor: const Color(0xFFEFF1F8),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(IconBroken.Arrow___Left_2,color: CustomColors.blue,),
        ),
        leadingWidth: 40.w,
        title: Text(
                  'Phone Number',
                  style: Styles.textStyle24,
                ),
        titleSpacing: 4,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 48.h, left: 15.w,bottom: 70.h),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Enter Your Number',
                  style: Styles.textStyle20,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  height: 48.h,
                  //width: 48.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: Colors.black, width: 1)),
                  child: DropdownButton(
                    isExpanded: false,
                    value: dropdownValue,
                    onChanged: (String? newValue) =>
                        setState(() => dropdownValue = newValue!),
                    items: widget.list
                        .map<DropdownMenuItem<String>>(
                            (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ))
                        .toList(),
                    style: Styles.textStyle16,
                    // add extra sugar..
                    icon: const Icon(Icons.arrow_drop_down),
                    underline: const SizedBox(),
                  ),
                ),
                SizedBox(
                  width: 260.w,
                  height: 48.h,
                  child: TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black,width: 1),
                          borderRadius: BorderRadius.circular(8.r)
                        ),
                          focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: CustomColors.blue,width: 2),
                              borderRadius: BorderRadius.circular(8.r),
                          )
                        )),
                ),
              ],
            ),
            SizedBox(
              height: 200.h,
            ),
            CustomButton(
              width: 340.w,
                backgroundColor: CustomColors.blue,
                text: 'Send OTP',
                func: () {
                Navigator.pushNamed(context, PhoneVerificationView.routeName);
                },
                style: Styles.textStyle16.copyWith(color: Colors.white))
          ],
        ),
      ),
    );
  }
}
