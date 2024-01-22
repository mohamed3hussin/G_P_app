import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/blocObserver/myBlocObserver.dart';
import 'package:g_p_app/features/home_screen/home_layout/home_layout.dart';
import 'package:g_p_app/routes/routes.dart';
import 'core/cach_helper/cach_helper.dart';

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
          initialRoute: AppRoutes.initialRoute,
          routes: AppRoutes.appRoutes,
        );
      },
    );
  }
}

