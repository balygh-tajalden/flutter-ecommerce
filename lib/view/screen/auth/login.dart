import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/auth/login_controller.dart';
import 'package:flutter_application_1/core/class/handlingdataview.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/view/widget/auth/confirmexitscope.dart';
import 'package:flutter_application_1/view/widget/auth/custombuttomauth.dart';
import 'package:flutter_application_1/view/widget/auth/customtextbodyauth.dart';
import 'package:flutter_application_1/view/widget/auth/customtextformauth.dart';
import 'package:flutter_application_1/view/widget/auth/logoauth.dart';
import 'package:flutter_application_1/view/widget/auth/customtextsignuporsignin.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "10".tr,
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(color: AppColor.grey),
        ),
      ),
      body: ConfirmExitScope(
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest!,
            widget: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 35),
              child: Form(
                key: controller.formstate,
                child: ListView(
                  children: [
                    const LogoAuth(),
                    
                    CustomTextBodyAuth(text: "13".tr),
                    const SizedBox(height: 65),

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
                      obscureText: controller.isShowPass,
                      onTapIcon: () {
                        controller.showPass();
                      },
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
                    InkWell(
                      onTap: () {
                        controller.goToForgetPassword();
                      },
                      child: Text("39".tr, textAlign: TextAlign.end),
                    ),

                    CustomButtomAuth(
                      text: "10".tr,
                      onPressed: () {
                        controller.login();
                      },
                    ),
                    SizedBox(height: 30),
                    CustomTextSignUpOrSignIn(
                      textone: "25".tr,
                      texttwo: "9".tr,
                      onTap: () {
                        controller.goToSignUp();
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
