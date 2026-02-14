import 'package:flutter_application_1/core/class/statusrequest.dart';
import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:flutter_application_1/core/functions/handlingdata.dart';
import 'package:flutter_application_1/core/services/services.dart';
import 'package:flutter_application_1/data/datasource/remote/cart/getcartdata.dart';
import 'package:flutter_application_1/data/model/cartmodel.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  getData();
  void goToProductDetails(Map<String, dynamic> item);
}

class CartControllerImp extends CartController {
  StatusRequest statusRequest = StatusRequest.none;
  CartData getCartData = CartData((Get.find()));
  MyServices myServices = Get.find();

  List<CartModel> data = [];
  double subtotal = 0;
  double deliveryFee = 45.0; // Mock value
  double totalPrice = 0;

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await getCartData.viewCart(
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.clear();
        List responseData = response['data'];
        data.addAll(responseData.map((e) => CartModel.fromJson(e)));
        calculateTotal();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  calculateTotal() {
    subtotal = 0;
    for (var item in data) {
      subtotal += (item.itemPrice ?? 0) * (item.cartCount ?? 0);
    }
    totalPrice = subtotal + deliveryFee;
  }

  add(CartModel cartModel) {
    // Logic to add item (can use the same from ProductDetails if global)
    // For now mock the UI update
    cartModel.cartCount = (cartModel.cartCount ?? 0) + 1;
    calculateTotal();
    update();
  }

  remove(CartModel cartModel) {
    if ((cartModel.cartCount ?? 0) > 1) {
      cartModel.cartCount = (cartModel.cartCount ?? 0) - 1;
      calculateTotal();
      update();
    }
  }

  delete(CartModel cartModel) {
    data.remove(cartModel);
    calculateTotal();
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  void goToProductDetails(Map<String, dynamic> item) {
    Get.toNamed(AppRoutes.productDetails, arguments: item);
  }
}
