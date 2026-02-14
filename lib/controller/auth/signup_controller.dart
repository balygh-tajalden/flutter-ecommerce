import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/core/class/statusrequest.dart';
import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:flutter_application_1/core/functions/auth_validate.dart';
import 'package:flutter_application_1/core/functions/custom_dialog.dart';
import 'package:flutter_application_1/core/functions/handlingdata.dart';
import 'package:flutter_application_1/data/datasource/remote/auth/signup.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  void signUp();
  void goToSignIn();
}

class SignUpControllerImp extends SignUpController with AuthValidation {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  StatusRequest? statusRequest = StatusRequest.none;

  SignupData signupData = SignupData(Get.find());

  List data = [];

  @override
  signUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postData(
        username.text,
        password.text,
        email.text,
        phone.text,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response["data"]);
          Get.offNamed(AppRoutes.verifycodesignup, arguments: {
            "email":email.text 
          });
        } else {
          customSnackbar("42".tr, "Email or Phone Number Already Exists");
          statusRequest = StatusRequest.none;
        }
      } else {
        statusRequest = StatusRequest.none;
      }
      update();
    } else {}
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();

    super.dispose();
  }
}
