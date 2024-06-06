import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/assets_data/iconBroken.dart';
import 'package:g_p_app/core/shared_widget/default_text.dart';
import 'package:g_p_app/core/text_style/styles.dart';
import 'package:g_p_app/features/forget_password_screens/new_password.dart';
import 'package:g_p_app/features/forget_password_screens/verification.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_cubit.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_state.dart';
import '../../core/colors/colors.dart';
import 'custom_page_route.dart';

class ForgetPasswordView extends StatefulWidget {
  static const String routeName='forget_password_view';
  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}
class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  var emailController = TextEditingController();
  var fpformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit=HomeCubit.get(context);
    return BlocListener(
      bloc: cubit,
      listener: (BuildContext context, state) {
        if(state is ForgetPasswordSuccess){
          Navigator.push(
            context,
            CustomPageRoute(child: VerificationView()),
          );
        }
        if(state is ForgetPasswordError){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(milliseconds: 2500),
              content: Center(
                  child: Text(
                    'Email is not correct!',
                    style: Styles.textStyle16
                        .copyWith(color: Colors.white),
                  )),
              backgroundColor: CustomColors.red,
            ),
          );
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 250.h,
                  width: 180.w,
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                      color: Color(0xFFEFF1F8),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100.r),
                          bottomRight: Radius.circular(100.r))),
                  child: Center(child: Padding(
                    padding: EdgeInsets.all(8.r),
                    child: Image.asset(AssetsData.sadRobotImage,width: 90.w,height: 180.h,),
                  )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.r),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AssetsData.indicator1,
                    height: 8.h,
                    width: 48.w,
                  ),
                ),
              ),
              SizedBox(
                height: 64.h,
              ),
              Text(
                'Forget Password?',
                style: Styles.textStyle24,
              ),
              Padding(
                padding: EdgeInsets.all(8.r),
                child: Text('Enter your email',
                    style: Styles.textStyle14),
              ),
              Form(
                key: fpformKey,
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                    child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10.r),
                        child: defaultTextField(
                          controller: emailController,
                          type: TextInputType.text,
                          label: 'Email',
                          prefix: IconBroken.Message,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ))),
              ),
              SizedBox(
                height: 105.h,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: EdgeInsets.all(16.r),
                  height: 45.h,
                  width: 60.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(8.r),
                      backgroundColor: Color(0XFF1B72C0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                    onPressed: () {
                      if (fpformKey.currentState!.validate()) {
                        cubit.forgotPassword(emailController.text);
                        //cubit.resetPassword('Pa\$\$w0rd');
                      }
                    },
                    child: Icon(
                      IconBroken.Arrow___Right_2,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
