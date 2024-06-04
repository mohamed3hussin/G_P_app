import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/colors/colors.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_cubit.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/account_screen.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/address/widget/edit_address_field.dart';

import '../../../../../../../core/assets_data/iconBroken.dart';
import '../../../../../../../core/text_style/styles.dart';

class EditAddressView extends StatefulWidget {
  static const String routeName = 'add_address';

  @override
  State<EditAddressView> createState() => _EditAddressViewState();
}

class _EditAddressViewState extends State<EditAddressView> {
  var formKey = GlobalKey<FormState>();
  TextEditingController firstNameEditingController = TextEditingController();
  TextEditingController lastNameEditingController = TextEditingController();
  TextEditingController streetEditingController = TextEditingController();
  TextEditingController cityEditingController = TextEditingController();
  TextEditingController countryEditingController = TextEditingController();
  TextEditingController postalCodeEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          'Edit Address',
          style: Styles.textStyle24,
        ),
        titleSpacing: 4,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                EditAddressField(
                    'First name:',
                    cubit.userAddress?.firstName ?? '',
                    firstNameEditingController),
                EditAddressField('Last name:', cubit.userAddress?.lName ?? '',
                    lastNameEditingController),
                EditAddressField('Street:', cubit.userAddress?.street ?? '',
                    streetEditingController),
                EditAddressField('City:', cubit.userAddress?.city ?? '',
                    cityEditingController),
                EditAddressField('Country:', cubit.userAddress?.country ?? '',
                    countryEditingController),
                EditAddressField(
                    'Postal Code:',
                    cubit.userAddress?.postalCode ?? '',
                    postalCodeEditingController),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  onTap: () {
                    if (formKey.currentState!.validate()){
                    cubit.updateUserAddress(
                        Fname: firstNameEditingController.text,
                        Lname: lastNameEditingController.text,
                        street: streetEditingController.text,
                        city: cityEditingController.text,
                        country: countryEditingController.text,
                        postalCode: postalCodeEditingController.text,
                        onSuccess: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Center(
                                  child: Text(
                                'Address updated successfully !',
                                style: Styles.textStyle16.copyWith(color: Colors.white),
                              )),
                              backgroundColor: CustomColors.green,
                            ),
                          );
                          // Navigate to the home screen
                          Future.delayed(Duration(seconds: 2), () {
                            Navigator.pushReplacementNamed(
                                context, AccountScreen.routeName);
                          });
                        });
                  }},
                  child: Container(
                    width: 330.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: CustomColors.blue,
                    ),
                    child: Center(
                      child: Text(
                        'Save Address',
                        style: Styles.textStyle20.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
