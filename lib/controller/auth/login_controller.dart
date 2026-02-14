import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/core/class/statusrequest.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:flutter_application_1/core/functions/custom_dialog.dart';
import 'package:flutter_application_1/core/functions/handlingdata.dart';
import 'package:flutter_application_1/core/functions/auth_validate.dart';
import 'package:flutter_application_1/core/services/services.dart';
import 'package:flutter_application_1/data/datasource/remote/auth/login.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  void login();
  void goToSignUp();
  void goToForgetPassword();
}

class LoginControllerImp extends LoginController with AuthValidation {
  LoginData loginData = LoginData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  bool isShowPass = true;

  MyServices myServices = Get.find();

  StatusRequest? statusRequest = StatusRequest.none;

  void showPass() {
    isShowPass = isShowPass == true ? false : true;
    update();
  }

  @override
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response["data"]);
          myServices.sharedPreferences.setString(
            "id",
            response['data']['user_id'].toString(),
          );
          myServices.sharedPreferences.setString(
            "username",
            response['data']['user_name'] ?? "",
          );
          myServices.sharedPreferences.setString(
            "email",
            response['data']['user_email'] ?? "",
          );
          myServices.sharedPreferences.setString(
            "phone",
            response['data']['user_phone'] ?? "",
          );
          myServices.sharedPreferences.setString(
            "image",
            response['data']['user_image'] ?? "",
          );
          myServices.sharedPreferences.setString("step", "2");

          // Save user to Firestore for Chat
          FirebaseFirestore.instance.collection("users").doc(response['data']['user_id'].toString()).set({
            "user_id": response['data']['user_id'].toString(),
            "user_name": response['data']['user_name'] ?? "",
            "user_email": response['data']['user_email'] ?? "",
            "user_image": response['data']['user_image'] ?? "",
            "last_seen": FieldValue.serverTimestamp(),
          }, SetOptions(merge: true));

          Get.offNamed(AppRoutes.mainPage);
        } else {
          customSnackbar("42".tr, "Email or Password Wrong", backgroundColor: Colors.red);
          statusRequest = StatusRequest.none;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.signUP);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      String? token = value;
         //print("My Token: $token"); 

    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }
}
