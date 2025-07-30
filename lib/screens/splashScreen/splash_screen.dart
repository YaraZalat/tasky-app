import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:ttttttt/core/constant/assets_constant.dart';

import '../../core/utils/app_shared_preference.dart';
import '../auth/login_screen.dart';
import '../home/view/homeScreen.dart';
import '../onboardingScreen/onboarding_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String routeName="SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      bool isFirstTime = (AppPreference.getData("isFirstTime")as bool) ?? true;

      if (isFirstTime) {
        AppPreference.saveData("isFirstTime", false);
        Navigator.pushReplacementNamed(context, OnboardingScreen.routeName);
      } else {
        final userId = AppPreference.getData("id");
        if (userId != null) {
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        } else {
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5F33E1),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInLeft(
              duration: Duration(milliseconds: 900),
                child: Image.asset(AssetsConstant.task)),
            BounceInDown(
                from: 50,
                delay: Duration(milliseconds: 900),
                duration: Duration(milliseconds: 600) ,
                child: Image.asset(AssetsConstant.y)),
          ],
        ),
      ),
    );
  }
}
