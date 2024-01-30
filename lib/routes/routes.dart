import 'package:flutter/material.dart';
import 'package:g_p_app/features/design_screens/design_categories/design_categories_view.dart';
import 'package:g_p_app/features/design_screens/design_details_view.dart';
import 'package:g_p_app/features/design_screens/design_explain_screen1.dart';
import 'package:g_p_app/features/design_screens/design_explain_screen2.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_layout.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/account_screen.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/phone/phone_number_view.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/phone/phone_verification.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/phone/phone_verified.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/profile_screen_view.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/settings/settings_view.dart';
import 'package:g_p_app/features/login_screen/loginScreenView.dart';
import 'package:g_p_app/features/onBoarding_screen/onBoarding_view.dart';
import 'package:g_p_app/features/signUpScreen/signUpScreenView.dart';
import '../features/design_screens/design_explain_screen3.dart';
import '../features/forget_password_screens/forget_password_view.dart';
import '../features/forget_password_screens/new_password.dart';
import '../features/forget_password_screens/verification.dart';
import '../features/home_screen/home_layout/home_screens/cart_screen/cart_screen.dart';
import '../features/home_screen/home_layout/home_screens/cart_screen/check_out_screen.dart';
import '../features/home_screen/home_layout/home_screens/cart_screen/order_success.dart';
import '../features/home_screen/home_layout/home_screens/categories_screen/all_categories_view.dart';
import '../features/home_screen/home_layout/home_screens/categories_screen/filtered_categories/filtered_category_screen_view.dart';
import '../features/home_screen/home_layout/home_screens/profile_screen/account/address/add_address_view.dart';
import '../features/home_screen/home_layout/home_screens/profile_screen/account/address/select_address_view.dart';
import '../features/home_screen/home_layout/home_screens/profile_screen/account/change_password/change_password_view.dart';
import '../features/home_screen/home_layout/home_screens/profile_screen/account/my_order/Track_order/track_order_view.dart';
import '../features/home_screen/home_layout/home_screens/profile_screen/account/my_order/my_orders_view.dart';
import '../features/home_screen/home_layout/home_screens/profile_screen/account/my_order/past_order/past_orders_view.dart';
import '../features/home_screen/home_layout/home_screens/profile_screen/account/my_order/past_order_details/past_order_details_view.dart';
import '../features/home_screen/home_layout/home_screens/profile_screen/account/my_order/rate_product/rate_product_view.dart';
import '../features/home_screen/home_layout/home_screens/profile_screen/account/my_order/return_order/return_orders_view.dart';
import '../features/home_screen/home_layout/home_screens/profile_screen/account/my_order/return_order_details/return_order_details_view.dart';
import '../features/home_screen/home_layout/home_screens/profile_screen/account/my_order/return_order_details/return_prodcut_reason_view.dart';
import '../features/home_screen/home_layout/home_screens/profile_screen/payment_method/add_creidt_screen.dart';
import '../features/home_screen/home_layout/home_screens/profile_screen/payment_method/payment_view.dart';
import '../features/home_screen/home_layout/home_screens/profile_screen/settings/currency_settings_view.dart';
import '../features/home_screen/home_layout/home_screens/profile_screen/settings/language_settings_view.dart';
import '../features/notifications_screen/notifications_screen_view.dart';
import '../features/product_details/product_details_view.dart';
import '../features/splash_screen/splash_view.dart';

class AppRoutes{
  static const String initialRoute=HomeLayout.routeName;
  static var appRoutes = <String, WidgetBuilder>{
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
    MyOrdersView.routeName:(context)=>MyOrdersView(),
    TrackOrderView.routeName:(context)=>TrackOrderView(),
    PastOrdersView.routeName:(context)=>PastOrdersView(),
    PastOrderDetailsView.routeName:(context)=>PastOrderDetailsView(),
    RateProductView.routeName:(context)=>RateProductView(),
    SelectAddressView.routeName:(context)=>SelectAddressView(),
    AddAddressView.routeName:(context)=>AddAddressView(),
    CartScreen.routeName:(context)=>CartScreen(),
    CheckOutScreen.routeName:(context)=>CheckOutScreen(),
    OrderSuccessView.routeName:(context)=>OrderSuccessView(),
    PaymentView.routeName:(context)=>PaymentView(),
    NotificationScreenView.routeName:(context)=>NotificationScreenView(),
    AllCategoriesView.routeName:(context)=>AllCategoriesView(),
    FilteredCategoryScreenView.routeName:(context)=>FilteredCategoryScreenView(),
    ProductDetailsView.routeName:(context)=>ProductDetailsView(),
    ChangePasswordView.routeName:(context)=>ChangePasswordView(),
    ReturnOrderDetailsView.routeName:(context)=>ReturnOrderDetailsView(),
    ReturnOrdersView.routeName:(context)=>ReturnOrdersView(),
    ReturnProductReasonView.routeName:(context)=>ReturnProductReasonView(),
    SettingsView.routeName:(context)=>SettingsView(),
    LanguageSettingsView.routeName:(context)=>LanguageSettingsView(),
    CurrencySettingsView.routeName:(context)=>CurrencySettingsView(),
    DesignExplainScreenOne.routeName:(context)=>DesignExplainScreenOne(),
    DesignExplainScreenTwo.routeName:(context)=>DesignExplainScreenTwo(),
    DesignExplainScreenThree.routeName:(context)=>DesignExplainScreenThree(),
    DesignDetailsView.routeName:(context)=>DesignDetailsView(),
    DesignCategoriesView.routeName:(context)=>DesignCategoriesView(),
    MySample.routeName:(context)=>MySample(),
  };
}