import 'package:flutter_application_1/core/class/crud.dart';
import 'package:flutter_application_1/linkapi.dart';

class VerifyCodeForegetPasswordData {
  Crud crud;
  VerifyCodeForegetPasswordData(this.crud);
  Future<dynamic> postData(String email, String verifycode) async {
    var response = await crud.postData(AppLink.verifyCodeForgetPassword, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
