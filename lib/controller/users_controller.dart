import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/core/class/statusrequest.dart';
import 'package:flutter_application_1/core/services/services.dart';
import 'package:get/get.dart';

class UsersController extends GetxController {
  List users = [];
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  getUsers() async {
    statusRequest = StatusRequest.loading;
    update();
    
    try {
      String currentUserId = myServices.sharedPreferences.getString("id") ?? "";
      
      // Fetch all users except current user from Firestore
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("users")
          .where("user_id", isNotEqualTo: currentUserId)
          .get();
          
      users.clear();
      for (var doc in querySnapshot.docs) {
        users.add(doc.data());
      }
      
      if (users.isEmpty) {
        statusRequest = StatusRequest.failure;
      } else {
        statusRequest = StatusRequest.success;
      }
    } catch (e) {
      statusRequest = StatusRequest.failure;
    }
    
    update();
  }

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }
}
