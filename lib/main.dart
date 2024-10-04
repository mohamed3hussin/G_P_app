import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:g_p_app/core/app_theme/application_theme.dart';
import 'package:g_p_app/core/blocObserver/myBlocObserver.dart';
import 'package:g_p_app/data/constants.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_cubit/home_cubit.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_layout.dart';
import 'package:g_p_app/features/splash_screen/splash_view.dart';
import 'package:g_p_app/routes/routes.dart';
import 'core/cache_helper/cache_helper.dart';
import 'data/api/api_manager.dart';
import 'features/dashboard/logic/dashBoardCubit/dashboard_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  ApiManager.init();
  Stripe.publishableKey = publishKey;
  await Stripe.instance.applySettings();
  var token = CacheHelper.getData(key: 'token');
  if (token != null) {
    AppRoutes.initialRoute = HomeLayout.routeName;
  } else {
    AppRoutes.initialRoute = CustomSplashScreen.routeName;
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
              create: (context) => DashboardCubit()
                ..getDeliveryMethods()
                ..getAdminAllProduct()
                ..getAdminAllProductDesigned()
                ..getAdminLogos(),
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
