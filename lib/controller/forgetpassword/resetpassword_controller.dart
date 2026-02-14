import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/core/class/statusrequest.dart';
import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:flutter_application_1/core/functions/auth_validate.dart';
import 'package:flutter_application_1/core/functions/custom_dialog.dart';
import 'package:flutter_application_1/core/functions/handlingdata.dart';
import 'package:flutter_application_1/data/datasource/remote/forgetpassword/resetpassword.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  void goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController with AuthValidation{
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest? statusRequest;

  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

  late TextEditingController password;
  late TextEditingController repassword;

  String? email;

  @override
  goToSuccessResetPassword() async {
    if (password.text != repassword.text) {
      return customSnackbar("42".tr, "Passwords don't match");
    }
    
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(email!, password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.successResetPassword);
        } else {
          customSnackbar("42".tr, "Try Again");
          statusRequest = StatusRequest.none; // إعادة الحالة لإخفاء التحميل
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    repassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();

    super.dispose();
  }
}
