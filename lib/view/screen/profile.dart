import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/auth/logout.dart';
import 'package:flutter_application_1/controller/profile_controller.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/linkapi.dart';
import 'package:flutter_application_1/view/widget/customappbar.dart';
import 'package:flutter_application_1/view/widget/profileItem.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfilControllerImp());
    final logoutController = Get.put(LogoutControllerImp());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: 
      
      CustomProfileAppBar(
        showBack: false,
        title: "Profile",
        
      ),
      
      body: Column(
        children: [
          const SizedBox(height: 80),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.dialog(
                    Dialog(
                      backgroundColor: Colors.transparent,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: InteractiveViewer(
                                child: Image.network(
                                  "${AppLink.imageUser}/${controller.image}",
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.person, size: 200),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColor.primaryColor, width: 2),
                  ),
                  child: CircleAvatar(
                    radius: 45,
                    backgroundImage: NetworkImage(
                      "${AppLink.imageUser}/${controller.image}",
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Text(
                controller.username!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                controller.email!,
                style: TextStyle(color: AppColor.grey, fontSize: 14),
              ),

              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 10,
                  ),
                ),
                child: const Text(
                  "Edit Profile",
                  style: TextStyle(color: AppColor.backgroundcolor),
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          Expanded(
            child: ListView(
              children: [
                profileItem(
                  icon: Icons.person_outline,
                  title: "My Profile",
                  onTap: () {},
                ),
                profileItem(
                  icon: Icons.message_outlined,
                  title: "Messages",
                 
                  onTap: () {},
                ),
                profileItem(
                  icon: Icons.favorite_border,
                  title: "Favourites",
                  onTap: () {},
                ),
                profileItem(
                  icon: Icons.location_on_outlined,
                  title: "Location",
                  onTap: () {},
                ),
                profileItem(
                  icon: Icons.settings_outlined,
                  title: "Settings",
                  onTap: () {},
                ),
              ],
            ),
          ),

          /// ===== Logout =====
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: TextButton.icon(
              onPressed: () {
                Get.defaultDialog(
                  title: "Logout",
                  titleStyle: const TextStyle(fontSize: 22,color: AppColor.primaryColor),
                  middleText: "Are you sure you want to logout?",
                  backgroundColor: AppColor.backgroundcolor,
                  actions: [
                    ElevatedButton(
                      onPressed: () => Get.back(),
                      child: const Text("Cancel",style: TextStyle(color: AppColor.black),),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        logoutController.logout();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text("Logout",style: TextStyle(color: AppColor.backgroundcolor),),
                    ),
                  ],
                );
              },
              icon: const Icon(Icons.logout, color: Colors.grey),
              label: const Text("Logout", style: TextStyle(color: Colors.grey)),
            ),
          ),
        ],
      ),
    );
  }
}



