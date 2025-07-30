
import 'package:flutter/material.dart';
import 'package:ttttttt/screens/auth/login_screen.dart';
import 'package:ttttttt/screens/auth/registerScreen.dart';
import 'package:ttttttt/screens/home/view/homeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ttttttt/screens/onboardingScreen/onboarding_screen.dart';
import 'package:ttttttt/screens/splashScreen/splash_screen.dart';
import 'core/utils/app_shared_preference.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreference.initSharedPreference();
  String routename= LoginScreen.routeName;
  AppPreference.getData("id").then((value){
    if(value!=null){
      routename=HomeScreen.routeName;
    }else{
      throw ("No user ID found in shared preference.");
    }
  });
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(TaskyApp (routeName: routename,));
}
class TaskyApp extends StatelessWidget {
  const TaskyApp({super.key, required this.routeName});
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: routeName,
      routes: {
        LoginScreen.routeName: (context)=> LoginScreen(),
        RegisterScreen.routeName: (context)=> RegisterScreen(),
        HomeScreen.routeName: (context)=> const HomeScreen(),
        OnboardingScreen.routeName:(context)=>OnboardingScreen(),
        SplashScreen.routeName:(context)=>const SplashScreen()
      },
    );
  }
}

