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

class _CustomSplashScreenState extends State<CustomSplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500), // Adjust the duration as needed
    );

    // Create a Tween to move the widgets from off-screen to the center
    Tween<Offset> _tween = Tween(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0));

    // Use the Tween with the controller to control the animation
    Animation<Offset> animation = _tween.animate(_animationController);
    _animationController.forward().whenComplete(() {
      // After animation is complete, wait for 1-2 seconds and then navigate
      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => onBoardingView()),
        );
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFCFCFF),Color(0xFFF3F4F9),Color(0xFFEFF1F8),Color(0xFFEFF1F8),Color(0xFFD3E4FF),Color(0xFF1B72C0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SlideTransition(
            position: _animationController.drive(
              Tween<Offset>(
                begin: Offset(0.0, 1.0),
                end: Offset(0.0, 0.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AssetsData.splashImage,
                  width: 200.sp,
                ),
                SizedBox(height: context.deviceHeight / 50),
                Text(
                  'Ai Shop',
                  style: Styles.textStyle24.copyWith(color: Color(0xFF760019),fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
