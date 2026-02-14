import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/color.dart';
import 'package:get/get.dart';

class CustomProfileAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  /// تحكم بالأزرار
  final bool showBack;
  final bool showMenu;
  final bool showProfile;
  final bool showNotifications;

  final VoidCallback? onMenuTap;
  final VoidCallback? onProfileTap;

  const CustomProfileAppBar({
    super.key,
    required this.title,
    this.showBack = false,
    this.showMenu = false,
    this.showProfile = false,
    this.showNotifications = false,
    this.onMenuTap,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.backgroundcolor,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,


      /// اليسار
      leading: showBack
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 18,
                color: AppColor.black,
              ),
              onPressed: () => Get.back(),
            )
          : showMenu
          ? IconButton(
              icon: const Icon(Icons.menu, color: AppColor.black),
              onPressed: onMenuTap,
            )
          : null,

      /// العنوان
      title: Text(
        title,
        style: const TextStyle(
          color: AppColor.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),

      /// اليمين
      actions: [
        if (showNotifications)
          IconButton(
              icon: const Icon(
                Icons.notifications_outlined,
                color: AppColor.primaryColor,
              ),
              onPressed: () {},
            ),
        if (showProfile)
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: onProfileTap,
              child: const CircleAvatar(
                radius: 16,
                backgroundColor: AppColor.orange,
                child: Icon(Icons.person, color: AppColor.white, size: 18),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
