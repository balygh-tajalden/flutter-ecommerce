import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/auth/signup_controller.dart';
import 'package:flutter_application_1/core/class/handlingdataview.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/view/widget/auth/customtextsignuporsignin.dart';
import 'package:flutter_application_1/view/widget/auth/confirmexitscope.dart';
import 'package:flutter_application_1/view/widget/auth/custombuttomauth.dart';
import 'package:flutter_application_1/view/widget/auth/customtextbodyauth.dart';
import 'package:flutter_application_1/view/widget/auth/customtextformauth.dart';
import 'package:flutter_application_1/view/widget/auth/customtexttitleauth.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolor,
        elevation: 0.0,
        title: Text(
          "9".tr,
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(color: AppColor.grey),
        ),
      ),
      body: ConfirmExitScope(
        child: GetBuilder<SignUpControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 35),
              child: Form(
                key: controller.formstate,
                child: ListView(
                  children: [
                    CustomTextTitleAuth(text: "11".tr),
                    const SizedBox(height: 20),
                    CustomTextBodyAuth(text: "12".tr),
                    const SizedBox(height: 65),

                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return null;
                      },
                      onChanged: (val) {
                        controller.validateUsername(val);
                      },
                      errorText: controller.usernameError,
                      mycontroller: controller.username,
                      hinttext: "15".tr,
                      labeltext: "14".tr,
                      iconData: Icons.person_2_outlined,
                    ),

                    CustomTextFormAuth(
                      isNumber: true,
                      valid: (val) {
                        return null;
                      },
                      onChanged: (val) {
                        controller.validatePhone(val);
                      },
                      errorText: controller.phoneError,
                      mycontroller: controller.phone,
                      hinttext: "17".tr,
                      labeltext: "16".tr,
                      iconData: Icons.phone_android_outlined,
                    ),

                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return null;
                      },
                      onChanged: (val) {
                        controller.validateEmail(val);
                      },
                      errorText: controller.emailError,
                      mycontroller: controller.email,
                      hinttext: "18".tr,
                      labeltext: "18".tr,
                      iconData: Icons.email_outlined,
                    ),

                    CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return null;
                      },
                      onChanged: (val) {
                        controller.validatePassword(val);
                      },
                      errorText: controller.passwordError,
                      mycontroller: controller.password,
                      hinttext: "20".tr,
                      labeltext: "19".tr,
                      iconData: Icons.lock_outlined,
                    ),

                    CustomButtomAuth(
                      text: "9".tr,
                      onPressed: () {
                        controller.signUp();
                      },
                    ),
                    SizedBox(height: 30),

                    CustomTextSignUpOrSignIn(
                      textone: "44".tr,
                      texttwo: "10".tr,
                      onTap: () {
                        controller.goToSignIn();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
