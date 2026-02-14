import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController {
  void goToLogin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  void goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }
}
