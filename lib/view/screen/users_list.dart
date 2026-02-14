import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/users_controller.dart';
import 'package:flutter_application_1/core/class/handlingdataview.dart';
import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:get/get.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UsersController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("اختر مستخدم للدردشة"),
        centerTitle: true,
      ),
      body: GetBuilder<UsersController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            itemCount: controller.users.length,
            itemBuilder: (context, index) {
              var user = controller.users[index];
              return Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text("${user['user_name'] ?? 'Unknown'}"),
                  subtitle: Text("${user['user_email'] ?? 'No Email'}"),
                  onTap: () {
                    Get.toNamed(AppRoutes.chat, arguments: {
                      "orderId": "general", // أو أي معرف ثابت للمحادثات الشخصية
                      "receiverId": (user['user_id'] ?? "0").toString(),
                      "receiverName": user['user_name'] ?? "Unknown",
                    });
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
