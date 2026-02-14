import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/core/constant/imagasset.dart';
import 'package:flutter_application_1/core/services/services.dart';
import 'package:flutter_application_1/view/screen/auth/login.dart';
import 'package:flutter_application_1/view/screen/language.dart';
import 'package:flutter_application_1/view/screen/mainpage.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    
    Widget nextScreen;
    String? step = myServices.sharedPreferences.getString("step");
    
    if (step == "2") {
      nextScreen = const MainPage();
    } else if (step == "1") {
      nextScreen = const Login();
    } else {
      nextScreen = const Language();
    }

    return AnimatedSplashScreen(
      duration: 3000,
      splash: Lottie.asset(AppImageAsset.loading),
      nextScreen: nextScreen,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: AppColor.backgroundcolor,
      splashIconSize: 250,
    );
  }
}
