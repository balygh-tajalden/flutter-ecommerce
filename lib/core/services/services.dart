import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  // تهيئة الخدمات الأساسية مثل Firebase وقاعدة البيانات المحلية Shared Preferences
  Future<MyServices> init() async {
    await Firebase.initializeApp();
    // Enable offline persistence for Firestore
    FirebaseFirestore.instance.settings = const Settings(persistenceEnabled: true);
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

// دالة البدء التي تقوم بتشغيل جميع الخدمات قبل انطلاق التطبيق
Future<void> initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
