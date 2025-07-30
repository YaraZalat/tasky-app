import 'package:flutter/material.dart';
import 'package:ttttttt/core/constant/assets_constant.dart';
import 'package:ttttttt/screens/onboardingScreen/widgets/onboarding.dart';

import '../../data/model/onboarding_model.dart';
import '../auth/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});
  static String routeName = "OnboardingScreen";
  @override
  State<OnboardingScreen> createState() => _OnboardingScreen();
}

class _OnboardingScreen extends State<OnboardingScreen> {
  List<OnboardingModel> pages = [
    OnboardingModel(
      imagePathl: AssetsConstant.onboard1,
      text1: "You can easily manage all of your daily",
      text2: "tasks in DoMe for free",
      mainText: "Manage your tasks",
      buttonText: 'Next',
    ),
    OnboardingModel(
      imagePathl: AssetsConstant.onboard2,
      mainText: "Create daily routine",
      text1: "In Tasky  you can create your personalized",
      text2: "routine to stay productive",
      buttonText: 'Next',
    ),
    OnboardingModel(
      imagePathl: AssetsConstant.onboard3,
      mainText: "Organize your tasks",
      text1: "You can organize your daily tasks by",
      text2: "adding your tasks into separate categories",
      buttonText: 'Get Started',
    ),
  ];
  int currentPage = 0;
  PageController pageController = PageController();
 
  @override
  Widget build(BuildContext context) {
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: pageController,
        onPageChanged: (index) {
          currentPage = index;
          setState(() {});
        },
        itemBuilder: (context, index) {
          currentPage = index;
          return OnboardingWidget(
            pages: pages,
            currentPage: index,
            widthScreen: widthScreen,
          );
        },
        itemCount: pages.length,
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          if (currentPage < 2) {
            pageController.nextPage(
              duration: Duration(microseconds: 200),
              curve: Curves.fastOutSlowIn,
            );
          } else {
            Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
          }
        },
        child: Text(
          "${pages[currentPage].buttonText}",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Color(0xff5F33E1),
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
