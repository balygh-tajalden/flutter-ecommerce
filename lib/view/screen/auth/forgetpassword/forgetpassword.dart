import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/forgetpassword/forgetpassword_controller.dart';
import 'package:flutter_application_1/core/class/handlingdataview.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/core/functions/validinput.dart';
import 'package:flutter_application_1/view/widget/auth/custombuttomauth.dart';
import 'package:flutter_application_1/view/widget/auth/customtextbodyauth.dart';
import 'package:flutter_application_1/view/widget/auth/customtextformauth.dart';
import 'package:flutter_application_1/view/widget/auth/customtexttitleauth.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "39".tr,
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
            child: Form(
              key: controller.formstate,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  CustomTextTitleAuth(text: "40".tr),
                  const SizedBox(height: 15),
                  CustomTextBodyAuth(text: "41".tr),
                  const SizedBox(height: 80),
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 5, 100, "email");
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
                  const SizedBox(height: 20),
                  CustomButtomAuth(
                    text: "30".tr,
                    onPressed: () {
                      controller.checkemail();
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
