import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/bottomnav_controller.dart';
import 'package:flutter_application_1/view/screen/cart.dart';
import 'package:flutter_application_1/view/screen/homepage.dart';
import 'package:flutter_application_1/view/screen/profile.dart';
import 'package:flutter_application_1/view/widget/custombottomnav.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavControllerImp());

    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: const [
            HomePage(),
            Center(child: Text("Favorite Page")),
            CartPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: const CustomBottomNav(),
      );
    });
  }
}
