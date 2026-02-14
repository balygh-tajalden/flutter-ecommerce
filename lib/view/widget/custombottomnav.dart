import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/bottomnav_controller.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:get/get.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BottomNavControllerImp>();

    return Container(
      height: 70,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
      decoration: BoxDecoration(
        color: AppColor.white.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(Icons.home_outlined, "Home", 0, controller),
            _navItem(Icons.favorite_outline, "Fav", 1, controller),
            _navItem(Icons.shopping_bag_outlined, "Cart", 2, controller),
            _navItem(Icons.person_outline, "Profile", 3, controller),
          ],
        ),
      ),
    );
  }

  Widget _navItem(
    IconData icon,
    String label,
    int index,
    BottomNavControllerImp controller,
  ) {
    return Obx(() {
      bool isActive = controller.currentIndex.value == index;

      return GestureDetector(
        onTap: () {
          controller.setIndex(index);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: isActive
                ? AppColor.primaryColor.withValues(alpha: 0.15)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Icon(icon,
                  color: isActive ? AppColor.primaryColor : AppColor.grey),
              if (isActive) ...[
                const SizedBox(width: 6),
                Text(
                  label,
                  style: const TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    });
  }
}
