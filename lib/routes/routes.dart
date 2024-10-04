import 'package:flutter/material.dart';
import 'package:g_p_app/features/dashboard/ui/dashboard_home.dart';
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
import 'package:g_p_app/features/onBoarding_screen/onBoarding_view.dart';
import '../features/authentication/forget_password_screens/forget_password_view.dart';
import '../features/authentication/forget_password_screens/new_password.dart';
import '../features/authentication/forget_password_screens/verification.dart';
import '../features/authentication/login_screen/loginScreenView.dart';
import '../features/authentication/signup_screen/signUpScreenView.dart';
import '../features/home_screen/design_screens/design_box_screen/design_box_screen.dart';
import '../features/home_screen/design_screens/design_categories/design_categories_view.dart';
import '../features/home_screen/design_screens/design_details_view.dart';
import '../features/home_screen/design_screens/design_explain_screen1.dart';
import '../features/home_screen/design_screens/design_explain_screen2.dart';
import '../features/home_screen/design_screens/design_explain_screen3.dart';
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
import '../features/home_screen/product_details/product_details_view.dart';
import '../features/home_screen/product_details/reviews_view.dart';
import '../features/splash_screen/splash_view.dart';

class AppRoutes{
  static String initialRoute=CustomSplashScreen.routeName;
  static var appRoutes = <String, WidgetBuilder>{
    CustomSplashScreen.routeName:(context)=>const CustomSplashScreen(),
    LoginScreenView.routeName:(context)=>const LoginScreenView(),
    SignUpScreenView.routeName:(context)=>const SignUpScreenView(),
    onBoardingView.routeName:(context)=>const onBoardingView(),
    HomeLayout.routeName:(context)=>const HomeLayout(),
    ForgetPasswordView.routeName:(context)=>const ForgetPasswordView(),
    NewPasswordView.routeName:(context)=>const NewPasswordView(),
    VerificationView.routeName:(context)=>const VerificationView(),
    ProfileScreenView.routeName:(context)=>const ProfileScreenView(),
    AccountScreen.routeName:(context)=>const AccountScreen(),
    PhoneNumberView.routeName:(context)=>PhoneNumberView(),
    PhoneVerificationView.routeName:(context)=>const PhoneVerificationView(),
    PhoneVerifiedView.routeName:(context)=>const PhoneVerifiedView(),
    MyOrdersView.routeName:(context)=>const MyOrdersView(),
    TrackOrderView.routeName:(context)=>const TrackOrderView(),
    PastOrdersView.routeName:(context)=>const PastOrdersView(),
    PastOrderDetailsView.routeName:(context)=>const PastOrderDetailsView(),
    RateProductView.routeName:(context)=>const RateProductView(),
    SelectAddressView.routeName:(context)=>const SelectAddressView(),
    EditAddressView.routeName:(context)=>const EditAddressView(),
    CartScreen.routeName:(context)=>const CartScreen(),
    CheckOutScreen.routeName:(context)=>const CheckOutScreen(),
    CheckOutScreenBuyNow.routeName:(context)=>const CheckOutScreenBuyNow(),
    OrderSuccessView.routeName:(context)=>const OrderSuccessView(),
    PaymentView.routeName:(context)=>const PaymentView(),
    FilteredCategoryScreenView.routeName:(context)=>const FilteredCategoryScreenView(),
    ProductDetailsView.routeName:(context)=>const ProductDetailsView(),
    ChangePasswordView.routeName:(context)=>const ChangePasswordView(),
    SettingsView.routeName:(context)=>const SettingsView(),
    LanguageSettingsView.routeName:(context)=>const LanguageSettingsView(),
    DesignExplainScreenOne.routeName:(context)=>const DesignExplainScreenOne(),
    DesignExplainScreenTwo.routeName:(context)=>const DesignExplainScreenTwo(),
    DesignExplainScreenThree.routeName:(context)=>const DesignExplainScreenThree(),
    DesignDetailsView.routeName:(context)=>const DesignDetailsView(),
    DesignCategoriesView.routeName:(context)=>const DesignCategoriesView(),
    ReviewsView.routeName:(context)=>const ReviewsView(),
    DashboardHomeScreen.routeName:(context)=>const DashboardHomeScreen(),
    DrawingRoomScreen.routeName:(context)=>const DrawingRoomScreen(),
    SeeAllProductsScreen.routeName:(context)=>const SeeAllProductsScreen(),
    CustomerServiceView.routeName:(context)=>const CustomerServiceView()

  };
}