import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:flutter_application_1/core/services/services.dart';
import 'package:get/get.dart';

abstract class LogoutController extends GetxController {
  void logout();
}

class LogoutControllerImp extends LogoutController {
  MyServices myServices = Get.find();

  @override
  void logout() async {
    myServices.sharedPreferences.remove("id");
    myServices.sharedPreferences.remove("username");
    myServices.sharedPreferences.remove("email");
    myServices.sharedPreferences.remove("phone");
    myServices.sharedPreferences.remove("image");
    myServices.sharedPreferences.setString("step", "1");
    
    Get.offAllNamed(AppRoutes.login);
  }
}
