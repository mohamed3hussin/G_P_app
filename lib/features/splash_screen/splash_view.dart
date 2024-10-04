import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/helper/handle_size.dart';
import 'package:g_p_app/features/onBoarding_screen/onBoarding_view.dart';
import '../../core/cache_helper/cache_helper.dart';
import '../../core/text_style/styles.dart';
import '../authentication/login_screen/loginScreenView.dart';

class CustomSplashScreen extends StatefulWidget {
  static const String routeName = 'splash_screen';

  const CustomSplashScreen({super.key});

  @override
  _CustomSplashScreenState createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _textAnimationController;
  late Animation<Offset> animation;
  late Animation<double> textAnimation;
  bool isTextVisible = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _textAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    animation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    ));

    textAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_textAnimationController);

    _animationController.forward().whenComplete(() {
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          isTextVisible = true;
          _textAnimationController.forward();
        });
      });

      Future.delayed(const Duration(seconds: 3), () {
        if(CacheHelper.getData(key: 'onBoarding') != null)
        {
          Navigator.of(context).pushReplacementNamed(LoginScreenView.routeName);
        }
        else{Navigator.of(context).pushReplacementNamed(onBoardingView.routeName);}
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _textAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [
              Color(0xFFFCFCFF),
              Color(0xFFF3F4F9),
              Color(0xFFEFF1F8),
              Color(0xFFEFF1F8),
              Color(0xFFD3E4FF),
              Color(0xFF1B72C0)
            ],
          ),
        ),
        child: Center(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SlideTransition(
                position: animation,
                child: Image.asset(
                  AssetsData.splashImage,
                  width: 200.sp,
                ),
              ),
              SizedBox(height: context.deviceHeight / 50),
              FadeTransition(
                opacity: textAnimation,
                child: Visibility(
                  visible: isTextVisible,
                  child: Text(
                    'AI Shop',
                    style: Styles.textStyle24.copyWith(
                      color: const Color(0XFF001C38),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
