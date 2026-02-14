import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customWarningDialog(String message) {
  Get.defaultDialog(
    title: "42".tr, // Warning
    middleText: message,
    titleStyle: const TextStyle(
        fontWeight: FontWeight.bold, fontSize: 18, color: Colors.red),
    middleTextStyle: const TextStyle(fontSize: 14),
    backgroundColor: Colors.white,
    radius: 15,
    contentPadding: const EdgeInsets.all(20),
    confirm: TextButton(
      onPressed: () => Get.back(),
      child: Text("8".tr, style: const TextStyle(color: Colors.blue)), // Continue
    ),
  );
}

void customSnackbar(String title, String message, {Color? backgroundColor, IconData? icon, bool isError = false}) {
  Get.snackbar(
    title,
    message,
    backgroundColor: backgroundColor ?? (isError ? Colors.redAccent.withValues(alpha: 0.8) : Colors.green.withValues(alpha: 0.8)),
    colorText: Colors.white,
    icon: Icon(
      icon ?? (isError ? Icons.warning_amber_rounded : Icons.check_circle_outline),
      color: Colors.white,
    ),
    snackPosition: SnackPosition.TOP,
    margin: const EdgeInsets.all(10),
    borderRadius: 10,
    duration: const Duration(seconds: 3),
  );
}
