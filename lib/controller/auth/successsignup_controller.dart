import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  void goToLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  void goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }
}
 