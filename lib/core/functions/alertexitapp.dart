import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() async {

  final result = await Get.dialog<bool>(
    AlertDialog(
      title: const Text('تنبيه'),
      content: const Text('هل تريد بالتأكيد الخروج من التطبيق؟'),
      actions: <Widget>[
        TextButton(
          child: const Text('إلغاء'),
          onPressed: () {
            Get.back(result: false);
          },
        ),
        TextButton(
          child: const Text('تأكيد الخروج'),
          onPressed: () {
            Get.back(result: true);
          },
        ),
      ],
    ),
  );

  return result ?? false;
}