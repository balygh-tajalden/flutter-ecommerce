import 'package:flutter_application_1/core/class/crud.dart';
import 'package:flutter_application_1/linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  Future<dynamic> viewCart(String userid) async {
    var response = await crud.postData(AppLink.getCartData, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }

  Future<dynamic> addCart(String userid, String itemid) async {
    var response = await crud.postData(AppLink.addCart, {"userid": userid, "itemid": itemid});
    return response.fold((l) => l, (r) => r);
  }

  Future<dynamic> deleteCart(String userid, String itemid) async {
    var response = await crud.postData(AppLink.deleteCart, {"userid": userid, "itemid": itemid});
    return response.fold((l) => l, (r) => r);
  }

  Future<dynamic> getCountCart(String userid, String itemid) async {
    var response = await crud.postData(AppLink.getCountItemsCart, {"userid": userid, "itemid": itemid});
    return response.fold((l) => l, (r) => r);
  }
}
