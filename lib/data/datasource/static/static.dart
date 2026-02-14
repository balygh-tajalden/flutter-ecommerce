import 'package:flutter_application_1/core/constant/imagasset.dart';
import 'package:flutter_application_1/data/model/onboardingmodel.dart';
import 'package:get/get.dart';

List<OnBoardingModel> getOnBoardingList() {
  return [
    OnBoardingModel(
      title: "2".tr,
      body: "3".tr,
      image: AppImageAsset.onBoardingImageOne,
    ),
    OnBoardingModel(
      title: "4".tr,
      body: "5".tr,
      image: AppImageAsset.onBoardingImageTwo,
    ),
    OnBoardingModel(
      title: "6".tr,
      body: "7".tr,
      image: AppImageAsset.onBoardingImageThree,
    ),
  ];
}

@Deprecated('Use getOnBoardingList() instead')
List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    title: "choose Product",
    body:
        "We Have a 100k Product , Choose \n Your Product From Our \nE-commerce Shop",
    image: AppImageAsset.onBoardingImageOne,
  ),
  OnBoardingModel(
    title: "Easy & Safe Payment",
    body:
        "Easy Checkout & Safe Payment\nmethod. Trusted by our Customers\nfrom all over the world.",
    image: AppImageAsset.onBoardingImageTwo,
  ),
  OnBoardingModel(
    title: "Track Your Order",
    body:
        "Best Tracker has been Used For\nTrack your order. You'll know where\nyour product is at the moment.",
    image: AppImageAsset.onBoardingImageThree,
  ),
];
