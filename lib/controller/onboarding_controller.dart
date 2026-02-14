import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:flutter_application_1/core/services/services.dart';
import 'package:flutter_application_1/data/datasource/static/static.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  void next();
  void onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentPage = 0;
  late PageController pageController;
  late List onboardingList;

  MyServices myServices = Get.find();

  @override
  void onInit() {
    pageController = PageController();
    onboardingList = getOnBoardingList();
    super.onInit();
  }

  @override
  void next() {
    currentPage++;
    if (currentPage > onboardingList.length - 1) {
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoutes.login);
    } else {
      pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 900),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void onPageChanged(int index) {
    currentPage = index;
    update();
  }
}
