import 'package:flutter_application_1/core/class/crud.dart';
import 'package:flutter_application_1/linkapi.dart';

class UserData {
  Crud crud;
  UserData(this.crud);

  Future<dynamic> getData() async {
    var response = await crud.postData(AppLink.getUserData, {});
    return response.fold((l) => l, (r) => r);
  }
}
