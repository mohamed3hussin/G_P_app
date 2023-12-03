import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_p_app/core/assets_data/assetsData.dart';
import 'package:g_p_app/core/helper/hundel_size.dart';
import 'package:g_p_app/features/onBoarding_screen/onBoarding_view.dart';
import '../../core/text_style/styles.dart';

class CustomSplashScreen extends StatefulWidget {
  @override
  _CustomSplashScreenState createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen> with TickerProviderStateMixin {
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
      duration: Duration(milliseconds: 1500),
    );

    _textAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    animation = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    ));

    textAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_textAnimationController);

    _animationController.forward().whenComplete(() {
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          isTextVisible = true;
          _textAnimationController.forward();
        });
      });

      Future.delayed(Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => onBoardingView()),
        );
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFCFCFF),
              Color(0xFFF3F4F9),
              Color(0xFFEFF1F8),
              Color(0xFFEFF1F8),
              Color(0xFFD3E4FF),
              Color(0xFF1B72C0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
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
                      color: Color(0XFF001C38),
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


