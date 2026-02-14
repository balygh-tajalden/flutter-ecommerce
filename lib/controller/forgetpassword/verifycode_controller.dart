import 'package:flutter_application_1/core/class/statusrequest.dart';
import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:flutter_application_1/core/functions/auth_validate.dart';
import 'package:flutter_application_1/core/functions/custom_dialog.dart';
import 'package:flutter_application_1/core/functions/handlingdata.dart';
import 'package:flutter_application_1/data/datasource/remote/forgetpassword/verifycode.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  void goToResetPassword(String verifycode);
}

class VerifyCodeControllerImp extends VerifyCodeController with AuthValidation {
  StatusRequest? statusRequest;
  String? email;
  VerifyCodeForegetPasswordData verifyCodeForegetPasswordData =
      VerifyCodeForegetPasswordData(Get.find());
  late String verifycode;

  @override
  goToResetPassword(verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeForegetPasswordData.postData(
      email!,
      verifycode,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.resetPassword, arguments: {"email": email});
      } else {
        customSnackbar("42".tr, "Verify Code Not Correct!");
        statusRequest = StatusRequest.none;
      }
    } else {
      statusRequest = StatusRequest.none;
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
