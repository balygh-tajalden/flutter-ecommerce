import 'package:flutter_application_1/core/class/statusrequest.dart';
import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:flutter_application_1/core/functions/handlingdata.dart';
import 'package:flutter_application_1/core/services/services.dart';
import 'package:flutter_application_1/data/datasource/remote/userdata.dart';
import 'package:get/get.dart';

abstract class ProfilController extends GetxController {
  void initialData();
  getData();
  void goToHome();
}

class ProfilControllerImp extends ProfilController {
  MyServices myServices = Get.find();


  String? username;
  String? id;
  List users = [];
  String? email;
  String? phone;
  String? image;

  UserData userData = UserData(Get.find());
  late StatusRequest statusRequest;
  List data = [];

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
    email = myServices.sharedPreferences.getString("email");
    phone = myServices.sharedPreferences.getString("phone");
    image = myServices.sharedPreferences.getString("image");


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
    statusRequest = StatusRequest.loading;
    var response = await userData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        users.addAll(response["users"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  
  @override
  void goToHome() {
    Get.toNamed(AppRoutes.homePage);
  }
}
