import 'package:flutter_application_1/core/functions/validinput.dart';
import 'package:get/get.dart';

mixin AuthValidation on GetxController {
  String? emailError;
  String? passwordError;
  String? usernameError;
  String? phoneError;

  void validateEmail(String val) {
    emailError = validInput(val, 5, 100, "email");
    update();
  }

  void validatePassword(String val) {
    passwordError = validInput(val, 5, 30, "password");
    update();
  }

  void validateUsername(String val) {
    usernameError = validInput(val, 5, 100, "username");
    update();
  }

  void validatePhone(String val) {
    phoneError = validInput(val, 5, 30, "phone");
    update();
  }
}
