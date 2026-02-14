import 'package:flutter_application_1/core/class/crud.dart';
import 'package:flutter_application_1/linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  
  Future<dynamic> postData(String username ,String password,String email,String phone) async {
    var response = await crud.postData(AppLink.signUp, {
      "username" : username,
      "password" : password,
      "email" : email,
      "phone" : phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
