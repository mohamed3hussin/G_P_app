import 'package:flutter/material.dart';
import 'package:g_p_app/features/dashboard/dashboard_home.dart';
import 'package:g_p_app/features/design_screens/design_categories/design_categories_view.dart';
import 'package:g_p_app/features/design_screens/design_details_view.dart';
import 'package:g_p_app/features/design_screens/design_explain_screen1.dart';
import 'package:g_p_app/features/design_screens/design_explain_screen2.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_layout.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/cart_screen/checkout_buynow_screen.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/home_screen/see_all_products.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/account_screen.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/phone/phone_number_view.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/phone/phone_verification.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/account/phone/phone_verified.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/customer_service_view.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/profile_screen_view.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/profile_screen/settings/settings_view.dart';
import 'package:g_p_app/features/login_screen/loginScreenView.dart';
import 'package:g_p_app/features/onBoarding_screen/onBoarding_view.dart';
import 'package:g_p_app/features/product_details/reviews_view.dart';
import 'package:g_p_app/features/signUpScreen/signUpScreenView.dart';
import '../features/dashboard/widget/add_delivery.dart';
import '../features/dashboard/widget/add_logo.dart';
import '../features/dashboard/widget/add_product.dart';
import '../features/dashboard/widget/edit_delivery.dart';
import '../features/dashboard/widget/edit_item.dart';
import '../features/dashboard/widget/edit_logo.dart';
import '../features/design_screens/design_box_screen/design_box_screen.dart';
import '../features/design_screens/design_explain_screen3.dart';
import '../features/forget_password_screens/forget_password_view.dart';
import '../features/forget_password_screens/new_password.dart';
import '../features/forget_password_screens/verification.dart';
import '../features/home_screen/home_layout/home_screens/cart_screen/cart_screen.dart';
import '../features/home_screen/home_layout/home_screens/cart_screen/check_out_screen.dart';
import '../features/home_screen/home_layout/home_screens/cart_screen/order_success.dart';
import '../features/home_screen/home_layout/home_screens/categories_screen/filtered_categories/filtered_category_screen_view.dart';
import '../features/home_screen/home_layout/home_screens/profile_screen/account/address/edit_address_view.dart';
import '../features/home_screen/home_layout/home_screens/profile_screen/account/address/select_address_view.dart';
import '../features/home_screen/home_layout/home_screens/profile_screen/account/change_password/change_password_view.dart';
import '../features/home_screen/home_layout/home_screens/profile_screen/account/my_order/Track_order/track_order_view.dart';
import '../features/home_screen/home_layout/home_screens/profile_screen/account/my_order/my_orders_view.dart';
import '../features/home_screen/home_layout/home_screens/profile_screen/account/my_order/past_order/past_orders_view.dart';
import '../features/home_screen/home_layout/home_screens/profile_screen/account/my_order/past_order_details/past_order_details_view.dart';
import '../features/home_screen/home_layout/home_screens/profile_screen/account/my_order/rate_product/rate_product_view.dart';
import '../features/home_screen/home_layout/home_screens/profile_screen/payment_method/payment_view.dart';
import '../features/home_screen/home_layout/home_screens/profile_screen/settings/language_settings_view.dart';
import '../features/product_details/product_details_view.dart';
import '../features/splash_screen/splash_view.dart';

class AppRoutes{
  static String initialRoute=CustomSplashScreen.routeName;
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
    EditAddressView.routeName:(context)=>EditAddressView(),
    CartScreen.routeName:(context)=>CartScreen(),
    CheckOutScreen.routeName:(context)=>CheckOutScreen(),
    CheckOutScreenBuyNow.routeName:(context)=>CheckOutScreenBuyNow(),
    OrderSuccessView.routeName:(context)=>OrderSuccessView(),
    PaymentView.routeName:(context)=>PaymentView(),
    FilteredCategoryScreenView.routeName:(context)=>FilteredCategoryScreenView(),
    ProductDetailsView.routeName:(context)=>ProductDetailsView(),
    ChangePasswordView.routeName:(context)=>ChangePasswordView(),
    SettingsView.routeName:(context)=>SettingsView(),
    LanguageSettingsView.routeName:(context)=>LanguageSettingsView(),
    DesignExplainScreenOne.routeName:(context)=>DesignExplainScreenOne(),
    DesignExplainScreenTwo.routeName:(context)=>DesignExplainScreenTwo(),
    DesignExplainScreenThree.routeName:(context)=>DesignExplainScreenThree(),
    DesignDetailsView.routeName:(context)=>DesignDetailsView(),
    DesignCategoriesView.routeName:(context)=>DesignCategoriesView(),
    ReviewsView.routeName:(context)=>ReviewsView(),
    DashboardHomeScreen.routeName:(context)=>DashboardHomeScreen(),
    // EditItem.routeName:(context)=>EditItem(),
    AddProduct.routeName:(context)=>AddProduct(),
    // EditLogo.routeName:(context)=>EditLogo(),
    AddLogo.routeName:(context)=>AddLogo(),
    AddDelivery.routeName:(context)=>AddDelivery(),
    EditDelivery.routeName:(context)=>EditDelivery(),
    DrawingRoomScreen.routeName:(context)=>DrawingRoomScreen(),
    SeeAllProductsScreen.routeName:(context)=>SeeAllProductsScreen(),
    CustomerServiceView.routeName:(context)=>CustomerServiceView()
  };
}