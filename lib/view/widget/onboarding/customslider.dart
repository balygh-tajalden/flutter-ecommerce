import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/onboarding_controller.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/data/datasource/static/static.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingListData = getOnBoardingList();
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onBoardingListData.length,
      itemBuilder: (context, i) => Column(
        children: [
          SizedBox(height: 60),
          onBoardingListData[i].image!.endsWith('.json')
              ? Lottie.asset(
                  onBoardingListData[i].image!,
                  height: Get.width / 1.3,
                  fit: BoxFit.fill,
                )
              : Image.asset(
                  onBoardingListData[i].image!,
                  height: Get.width / 1.3,
                  fit: BoxFit.fill,
                ),
          SizedBox(height: 60),
          Text(
            onBoardingListData[i].title!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: AppColor.black,
            ),
          ),
          SizedBox(height: 30),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              onBoardingListData[i].body!,
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 2,
                color: AppColor.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
