import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/class/statusrequest.dart';
import 'package:flutter_application_1/core/functions/custom_dialog.dart';
import 'package:flutter_application_1/core/functions/handlingdata.dart';
import 'package:flutter_application_1/core/services/services.dart';
import 'package:flutter_application_1/data/datasource/remote/cart/getcartdata.dart';
import 'package:flutter_application_1/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  void intialData();
  void add();
  void deleteCart(String itemid);
  void addCart(String itemid);
  void remove();
  Future<int> getCountItems(String itemid);
}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemsModel itemsModel;

  CartData cartData = CartData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  int countitems = 0;
  @override
  intialData() async {
    statusRequest = StatusRequest.loading;
    update();
    itemsModel = Get.arguments['itemsmodel'];
    countitems = await getCountItems(itemsModel.itemId.toString());
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  add() {
    countitems++;
    update();
    addCart(itemsModel.itemId.toString());
  }

  @override
  remove() {
    if (countitems > 0) {
      countitems--;
      update();
      deleteCart(itemsModel.itemId.toString());
    }
  }

  addCart(String itemid) async {
    var response = await cartData.addCart(
      myServices.sharedPreferences.getString("id")!,
      itemid,
    );
    StatusRequest checkoutStatus = handlingData(response);
    if (StatusRequest.success == checkoutStatus) {
      if (response['status'] == "success") {
        customSnackbar("Success", "Item added to cart", backgroundColor: Colors.green, icon: Icons.check_circle_outline);
      }
    }
  }

  deleteCart(String itemid) async {
    var response = await cartData.deleteCart(
      myServices.sharedPreferences.getString("id")!,
      itemid,
    );
    StatusRequest checkoutStatus = handlingData(response);
    if (StatusRequest.success == checkoutStatus) {
      if (response['status'] == "success") {
        customSnackbar("Success", "Item removed from cart", backgroundColor: Colors.redAccent, icon: Icons.remove_shopping_cart);
      }
    }
  }

  @override
  getCountItems(String itemid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountCart(
      myServices.sharedPreferences.getString("id")!,
      itemid,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int count = 0;
        count = int.parse(response['data'].toString());
        return count;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    return 0;
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
