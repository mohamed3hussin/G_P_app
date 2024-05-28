import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:g_p_app/core/app_theme/application_theme.dart';
import 'package:g_p_app/core/blocObserver/myBlocObserver.dart';
import 'package:g_p_app/data/constants.dart';
import 'package:g_p_app/features/dashboard/dashboard_home.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_cubit.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_layout.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_screens/home_screen/home_screen.dart';
import 'package:g_p_app/features/login_screen/loginScreenView.dart';
import 'package:g_p_app/routes/routes.dart';
import 'core/cach_helper/cach_helper.dart';
import 'data/api/api_manager.dart';
import 'features/login_screen/loginCubit/loginCubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  ApiManager.init();
  Stripe.publishableKey = publishKey;
  await Stripe.instance.applySettings();
  var token = CacheHelper.getData(key: 'token');
  if (token != null) {
    if(token == 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9naXZlbm5hbWUiOiJBZG1pbiIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL2VtYWlsYWRkcmVzcyI6IkFkbWluQGdtYWlsLmNvbSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6WyJVc2VyIiwiQWRtaW4iXSwiZXhwIjoxNzE5NDQ3OTY5LCJpc3MiOiJodHRwczovL2xvY2FsaG9zdDo3MDg0IiwiYXVkIjoiTXlTZWN1cmVLZXkifQ.gTeQKfkz9VmnjpQQ8iFJ0EJcbMtcA5jDcXONr3mwllo')
    {
      AppRoutes.initialRoute = DashboardHomeScreen.routeName;
    }else
    {
      AppRoutes.initialRoute = HomeLayout.routeName;
    }

  } else {
    AppRoutes.initialRoute = LoginScreenView.routeName;
  }
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
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => HomeCubit()
                  ..getAllProduct()
                  ..getBestSellingProduct()
                  ..getNewArrivalProduct()
                  ..getWishList()
                  ..getCart()
                  ..getUserOrders()),
            BlocProvider(
              create:(context)=>LoginScreenViewCubit(),
            )
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ApplicationTheme.lightTheme,
            initialRoute: AppRoutes.initialRoute,
            routes: AppRoutes.appRoutes,
          ),
        );
      },
    );
  }
}
