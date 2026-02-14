import 'package:flutter_application_1/core/class/crud.dart';
import 'package:get/get.dart';

class IntialBindings extends Bindings {
  @override
  void dependencies() {
    // حقن كلاس العمليات الأساسية (CRUD) عند تشغيل التطبيق
    Get.put(Crud());
  }
}
