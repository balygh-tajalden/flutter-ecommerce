import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/auth/successresetpassword_controller.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/view/widget/auth/custombuttomauth.dart';
import 'package:get/get.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller = Get.put(
      SuccessResetPasswordControllerImp(),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          "32".tr,
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Center(
              child: Icon(
                Icons.check_circle_outline_outlined,
                size: 72,
                color: AppColor.primaryColor,
              ),
            ),
            Text(
              "Successfully",
              style: Theme.of(context).textTheme.displaySmall!,
            ),
            SizedBox(height: 25),

            Text("You Can Sign In Now"),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButtomAuth(
                text: "10".tr,
                onPressed: () {
                  controller.goToLogin();
                },
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
