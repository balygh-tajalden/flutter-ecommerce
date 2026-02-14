import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/forgetpassword/resetpassword_controller.dart';
import 'package:flutter_application_1/core/class/handlingdataview.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/core/functions/validinput.dart';
import 'package:flutter_application_1/view/widget/auth/custombuttomauth.dart';
import 'package:flutter_application_1/view/widget/auth/customtextbodyauth.dart';
import 'package:flutter_application_1/view/widget/auth/customtextformauth.dart';
import 'package:flutter_application_1/view/widget/auth/customtexttitleauth.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(
      ResetPasswordControllerImp(),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          "34".tr,
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 35),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  CustomTextTitleAuth(text: "34".tr),
                  const SizedBox(height: 20),
                  CustomTextBodyAuth(text: "36".tr),
                  const SizedBox(height: 65),

                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 5, 30, "password");
                    },
                    onChanged: (val) {
                      controller.validatePassword(val);
                    },
                    errorText: controller.passwordError,
                    mycontroller: controller.password,
                    hinttext: "34".tr,
                    labeltext: "19".tr,
                    iconData: Icons.lock_outlined,
                  ),
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 5, 30, "password");
                    },
                    onChanged: (val) {
                      controller.validatePassword(val);
                    },
                    errorText: controller.passwordError,
                    mycontroller: controller.repassword,
                    hinttext: "35".tr,
                    labeltext: "19".tr,
                    iconData: Icons.lock_outlined,
                  ),

                  CustomButtomAuth(
                    text: "33".tr,
                    onPressed: () {
                      controller.goToSuccessResetPassword();
                    },
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
