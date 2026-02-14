import 'package:flutter_application_1/controller/bottomnav_controller.dart';
import 'package:flutter_application_1/core/class/statusrequest.dart';
import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:flutter_application_1/core/functions/handlingdata.dart';
import 'package:flutter_application_1/core/services/services.dart';
import 'package:flutter_application_1/data/datasource/remote/homedata.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  void initialData();
  getData();
  void goToProfile();
  void goToProductDetails(itemsModel);
  void goToCart();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  List categories = [];
  List items = [];

  String? username;
  String? id;
  String? email;
  String? image;
  String? phone;

  HomeData homeData = HomeData(Get.find());
  late StatusRequest statusRequest;
  List data = [];

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
    email = myServices.sharedPreferences.getString("email");
    image = myServices.sharedPreferences.getString("image");
    phone = myServices.sharedPreferences.getString("phone");

    update();
  }

  @override
  void onInit() {
    initialData();
    getData();
    super.onInit();
  }

  @override
  getData() async {
    if (categories.isEmpty) {
      statusRequest = StatusRequest.loading;
      update();
    }
    
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.clear();
        items.clear();
        categories.addAll(response["categories"]);
        items.addAll(response["items"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void goToProfile() {
    try {
      Get.find<BottomNavControllerImp>().setIndex(3);
    } catch (e) {
      // Controller not found
    }
  }

  @override
  void goToProductDetails(itemsModel) {
    Get.toNamed(
      AppRoutes.productDetails,
      arguments: {"itemsmodel": itemsModel},
    );
  }

  @override
  void goToCart() {
    Get.toNamed(AppRoutes.cart);
  }
}
