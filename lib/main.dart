import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/blocObserver/myBlocObserver.dart';
import 'package:g_p_app/features/forget_password_screen/forget_password_view.dart';
import 'package:g_p_app/features/forget_password_screen/new_password.dart';
import 'package:g_p_app/features/forget_password_screen/verification.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_layout.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/home_screen/home_screen.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/account_screen.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/phone/phone_number_view.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/phone/phone_verification.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/phone/phone_verified.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/profile_screen_view.dart';
import 'package:g_p_app/features/login_screen/loginScreenView.dart';
import 'package:g_p_app/features/onBoarding_screen/onBoarding_view.dart';
import 'package:g_p_app/features/signUpScreen/signUpScreenView.dart';

import 'core/cach_helper/cach_helper.dart';
import 'features/splash_screen/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child)
      {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF1B72C0)),
            useMaterial3: true,
          ),
          initialRoute: HomeLayout.routeName,
          routes: {
            CustomSplashScreen.routeName:(context)=>CustomSplashScreen(),
            LoginScreenView.routeName:(context)=>LoginScreenView(),
            SignUpScreenView.routeName:(context)=>SignUpScreenView(),
            onBoardingView.routeName:(context)=>onBoardingView(),
            HomeLayout.routeName:(context)=>HomeLayout(),
            ForgetPasswordView.routeName:(context)=>ForgetPasswordView(),
            NewPasswordView.routeName:(context)=>NewPasswordView(),
            VerificationView.routeName:(context)=>VerificationView(),
            ProfileScreenView.routeName:(context)=>ProfileScreenView(),
            AccountScreen.routeName:(context)=>AccountScreen(),
            PhoneNumberView.routeName:(context)=>PhoneNumberView(),
            PhoneVerificationView.routeName:(context)=>PhoneVerificationView(),
            PhoneVerifiedView.routeName:(context)=>PhoneVerifiedView(),
          },
        );
      },
    );
  }
}

