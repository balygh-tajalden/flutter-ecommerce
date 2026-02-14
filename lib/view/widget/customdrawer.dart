import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/profile_controller.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:flutter_application_1/linkapi.dart';
import 'package:flutter_application_1/view/widget/profileitem.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfilControllerImp());
    return Drawer(
      backgroundColor: AppColor.white,
      child: Column(
        children: [
          const SizedBox(height: 40),
          Container(
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
          const SizedBox(height: 20),

          Text(
            controller.username!,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Navigator.pop(context);
            },
          ),

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

                  onTap: () {
                    Get.toNamed(AppRoutes.chat);
                  },
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
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: TextButton.icon(
              onPressed: () {
                // controller.logout();
              },
              icon: const Icon(Icons.logout, color: Colors.red),
              label: const Text("Logout", style: TextStyle(color: Colors.red)),
            ),
          ),
        ],
      ),
    );
  }
}
